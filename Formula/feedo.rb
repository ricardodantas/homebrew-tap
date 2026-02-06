class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  version "1.1.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "da168521577d813d43e4d8346381ff26ee01828b28dd9b3193f3c52694aeee8c"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f3f044cee1325ce585e068b9ccfa93e7135246f950a5853c896cb13965f0d227"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75aa58fa91d2a80f0285414d36f2c0fd0401cbcf0d315b0ca11be80d4f8d59b9"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc087bc197aa9a04dad287cfd51a3429654a0accd232fc5b6ad1ec5d0ed1ea8c"
    end
  end

  def install
    bin.install "feedo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
