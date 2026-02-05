class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  version "1.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6129e61b4ab3a995ad13bb74a17c60baf1df8f0df8e7a02246c7866b71e9f8a4"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "295e7cdb26de569c3512a71255eca9d0d4997a9e0478d8b15dd87705e70e890b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9eb9eefa2736085756c10c015fad5ac9a1b9bd0182b0f56ddad8c29196b5389"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c14b3e5c431234d4e3020c7f87a06c0fb1e7aa700c33b31353f2524cbdf44da7"
    end
  end

  def install
    bin.install "feedo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
