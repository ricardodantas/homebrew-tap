class Perch < Formula
  desc "Beautiful terminal social client for Mastodon and Bluesky"
  homepage "https://github.com/ricardodantas/perch"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "08b6af071bbc8c6d710c82eea1413c3b0acb4a8ba86e87b7fd20226dada06b05"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e16d3a724da7c604746b0265eb98f5e0f4f2439aca4fb4cd44ad93d5868b6a20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ff0515cf94a832f9573b228f81920db2da1cadb45f21090aa06114468965c27"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "916f39b3c8c1751a9a32628974ee032ae1f459106f2efa9f0800dbd2a50b2d7f"
    end
  end

  def install
    bin.install "perch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perch --version")
  end
end
