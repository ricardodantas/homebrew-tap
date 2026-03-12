class Typefully < Formula
  desc "CLI client for the Typefully API. Create, schedule, and publish social media content from your terminal."
  homepage "https://github.com/ricardodantas/typefully-cli"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/typefully-cli/releases/download/v#{version}/typefully-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f8026409de1a06779361e94e5b2dd3d9d7bb4ad611276eecfddc9e0458916060"
    end
    on_intel do
      url "https://github.com/ricardodantas/typefully-cli/releases/download/v#{version}/typefully-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "029261d704571a043cf479032d39aca3b3451ac4cb41013fb2bb8c1778389c36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/typefully-cli/releases/download/v#{version}/typefully-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8601095d9cf4a55881cf5e487045b0d223744e5c8bdf994bb5ee2d47f33f73a"
    end
    on_intel do
      url "https://github.com/ricardodantas/typefully-cli/releases/download/v#{version}/typefully-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "808d1ee5014f62c8ee5b7f3f972d82d4b8836ad301ef8a6a88e887e3ca3d2fd9"
    end
  end

  def install
    bin.install "typefully"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/typefully --version")
  end
end
