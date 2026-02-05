class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  version "1.1.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fb3dbc9d0dc782356e9071a5c3b6c10db6f9a4487fac8b3082978a90b2b702e9"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3feb7e17fa95709efc6167e9d3b4a2b6b0d7955bfc3837cc54665f2bbae6b242"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5cde51cbcbcd1f4a9269e4b9ce3799df8c6cbd613e7e94ce0d7033fccd25add"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47f437affa9de15e43d4599ffd8929036524f4ae5a9a31ef0c070f928049c8b1"
    end
  end

  def install
    bin.install "feedo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
