class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  version "1.1.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "888c053543cc6f0540734944c4643e3be8281e962bdcca7224da03bff8a897f4"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "0323238cea65bead52878c310ddc23c3bf044c2c57497ce54c0a6c9d99f9620f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b7cabe0dcc05bdaae9649ce388b6e27384c50e1a93e111494def16f726a2f11"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a973d3eb57d34da40a56537c9696f84ea856f33827501d1ace3766bf291a4aa"
    end
  end

  def install
    bin.install "feedo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
