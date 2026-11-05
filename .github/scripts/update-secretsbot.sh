#!/usr/bin/env bash
# Renders Formula/secretsbot.rb and Casks/secretsbot.rb from a secretsbot
# release (https://github.com/ricardodantas/secretsbot), after checking every
# file it pins. Run by .github/workflows/update-secretsbot.yml; works locally
# too (macOS, gh, jq, python3):
#
#   .github/scripts/update-secretsbot.sh [vX.Y.Z]     (default: the latest release)
#
# It changes nothing unless the release is complete: the Linux archives and
# checksums CI published, and the macOS archives and SecretsBot-<version>.dmg
# that the maintainer signs, notarizes and attaches afterwards
# (packaging/macos/sign-and-notarize-release.sh in secretsbot). Then it checks:
#   - every archive against its .sha256, and against sha256.sum (Linux, written
#     and attested by CI) or macos.sha256.sum (macOS, attached with them);
#   - the Linux archives' build provenance (`gh attestation verify`);
#   - that every macOS binary and the dmg carry a valid Developer ID signature
#     of team 8966HM892G, the dmg passes Gatekeeper and has a stapled ticket;
# and renders both files with the release's own templates
# (packaging/homebrew/ at the tag), which check the checksums again.
#
# Outputs (GITHUB_OUTPUT when set): changed=true|false, version=X.Y.Z.
set -euo pipefail

repo=ricardodantas/secretsbot
team_id=8966HM892G
apps=(secretsbot secretsbotd secretsbot-classify)
linux_targets=(aarch64-unknown-linux-gnu x86_64-unknown-linux-gnu)
mac_targets=(aarch64-apple-darwin x86_64-apple-darwin)

out() { [ -n "${GITHUB_OUTPUT:-}" ] && echo "$1" >> "$GITHUB_OUTPUT"; return 0; }
notice() { echo "::notice title=secretsbot::$*"; }
die() { echo "::error title=secretsbot::$*"; exit 1; }

cd "$(git rev-parse --show-toplevel)"
out changed=false

tag="${1:-${TAG:-}}"
if [ -z "$tag" ]; then
    if ! tag="$(gh release view --repo "$repo" --json tagName --jq .tagName 2> /dev/null)"; then
        notice "no published release of $repo is visible yet; nothing to do"
        exit 0
    fi
fi
[[ "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+(-[0-9A-Za-z.-]+)?$ ]] || die "'$tag' is not a release tag (vX.Y.Z)"
version="${tag#v}"
out "version=$version"

release="$(gh release view "$tag" --repo "$repo" --json isDraft,isPrerelease,assets)" \
    || die "no release $tag in $repo"
[ "$(jq -r .isDraft <<< "$release")" = false ] || die "$tag is a draft"
[ "$(jq -r .isPrerelease <<< "$release")" = false ] || { notice "$tag is a prerelease; the tap only follows releases"; exit 0; }

# Already current?
if grep -qF "/releases/download/$tag/" Formula/secretsbot.rb 2> /dev/null \
    && grep -qF "version \"$version\"" Casks/secretsbot.rb 2> /dev/null; then
    notice "Formula/secretsbot.rb and Casks/secretsbot.rb are already at $tag"
    exit 0
fi

# Complete? The macOS files appear only once they are signed and notarized.
names="$(jq -r '.assets[].name' <<< "$release")"
missing=()
for app in "${apps[@]}"; do
    for t in "${linux_targets[@]}" "${mac_targets[@]}"; do
        for f in "$app-$t.tar.xz" "$app-$t.tar.xz.sha256"; do
            grep -qxF "$f" <<< "$names" || missing+=("$f")
        done
    done
done
for f in sha256.sum macos.sha256.sum "SecretsBot-$version.dmg" "SecretsBot-$version.dmg.sha256"; do
    grep -qxF "$f" <<< "$names" || missing+=("$f")
done
if [ "${#missing[@]}" -gt 0 ]; then
    notice "$tag is not complete yet (missing ${#missing[@]} files, e.g. ${missing[0]}): waiting for the signed macOS files (sign-and-notarize-release.sh)"
    exit 0
fi

work="$(mktemp -d "${RUNNER_TEMP:-${TMPDIR:-/tmp}}/secretsbot-tap.XXXXXX")"
trap 'rm -rf "$work"' EXIT
mkdir -p "$work/assets" "$work/templates"
gh release download "$tag" --repo "$repo" --dir "$work/assets" \
    --pattern '*-apple-darwin.tar.xz' --pattern '*-apple-darwin.tar.xz.sha256' \
    --pattern '*-unknown-linux-gnu.tar.xz' --pattern '*-unknown-linux-gnu.tar.xz.sha256' \
    --pattern 'sha256.sum' --pattern 'macos.sha256.sum' \
    --pattern "SecretsBot-$version.dmg" --pattern "SecretsBot-$version.dmg.sha256"

# Checksums: the per-file .sha256 and the release-wide list must agree.
check_sum() {
    local file="$1" list="$2" actual expected listed
    actual="$(shasum -a 256 "$work/assets/$file" | awk '{ print $1 }')"
    expected="$(awk '{ print $1; exit }' "$work/assets/$file.sha256")"
    listed="$(awk -v f="$file" '{ name = $2; sub(/^\*/, "", name); sub(/^\.\//, "", name) } name == f { print $1; exit }' "$work/assets/$list")"
    [ "$actual" = "$expected" ] || die "$file does not match $file.sha256"
    [ "$actual" = "$listed" ] || die "$file is not in $list with this checksum"
}
for app in "${apps[@]}"; do
    for t in "${linux_targets[@]}"; do check_sum "$app-$t.tar.xz" sha256.sum; done
    for t in "${mac_targets[@]}"; do check_sum "$app-$t.tar.xz" macos.sha256.sum; done
done
check_sum "SecretsBot-$version.dmg" macos.sha256.sum
echo "checksums OK"

# Provenance of the Linux archives (built and attested by secretsbot's CI).
for app in "${apps[@]}"; do
    for t in "${linux_targets[@]}"; do
        gh attestation verify "$work/assets/$app-$t.tar.xz" --repo "$repo" > /dev/null \
            || die "$app-$t.tar.xz has no valid build provenance attestation from $repo"
    done
done
echo "Linux attestations OK"

# The macOS files must be signed by the team (and the dmg notarized).
[ "$(uname -s)" = Darwin ] || die "the macOS signature checks need macOS"
for app in "${apps[@]}"; do
    for t in "${mac_targets[@]}"; do
        dir="$work/mac/$app-$t"
        mkdir -p "$dir"
        tar -xJf "$work/assets/$app-$t.tar.xz" -C "$dir" --strip-components=1
        codesign --verify --strict "$dir/$app" || die "$app-$t: $app has no valid signature"
        codesign --display --verbose=2 "$dir/$app" 2>&1 | grep -qx "TeamIdentifier=$team_id" \
            || die "$app-$t: $app is not signed by team $team_id"
    done
done
dmg="$work/assets/SecretsBot-$version.dmg"
codesign --verify --strict "$dmg" || die "the dmg has no valid signature"
codesign --display --verbose=2 "$dmg" 2>&1 | grep -qx "TeamIdentifier=$team_id" || die "the dmg is not signed by team $team_id"
spctl --assess --type open --context context:primary-signature "$dmg" || die "Gatekeeper rejects the dmg"
xcrun stapler validate "$dmg" > /dev/null || die "the dmg has no stapled notarization ticket"
echo "macOS signatures OK"

# The templates and renderers of that release.
for f in render_formula.py secretsbot.rb.in render_cask.py secretsbot-cask.rb.in; do
    gh api "repos/$repo/contents/packaging/homebrew/$f?ref=$tag" -H 'Accept: application/vnd.github.raw' > "$work/templates/$f"
done
mkdir -p Formula Casks
python3 -I "$work/templates/render_formula.py" --version "$version" --artifacts "$work/assets" \
    --template "$work/templates/secretsbot.rb.in" --output Formula/secretsbot.rb
python3 -I "$work/templates/render_cask.py" --version "$version" --dmg "$dmg" \
    --template "$work/templates/secretsbot-cask.rb.in" --output Casks/secretsbot.rb

if git diff --quiet -- Formula/secretsbot.rb Casks/secretsbot.rb && [ -z "$(git ls-files --others --exclude-standard Formula/secretsbot.rb Casks/secretsbot.rb)" ]; then
    notice "the rendered files did not change"
    exit 0
fi
out changed=true
echo "rendered Formula/secretsbot.rb and Casks/secretsbot.rb for $tag"
