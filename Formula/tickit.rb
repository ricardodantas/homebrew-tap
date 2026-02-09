class Tickit < Formula
  desc "Terminal-based task manager with CLI and TUI"
  homepage "https://github.com/ricardodantas/tickit"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7b7d559a78ccee9c74ec256ffd74eb8931d08dde2164c60a4fef92802f2790f2"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9c60b5de90d4b8065c8c8d1a9d049916114dabe218848275403342d6f266424a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ceccf6da6beb97aef13ba59dbd1edcfbd5247fd43f879e6f2e4c2b5f62b3d87"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "87ae191c118bb2a1178cd81fb9ad048b1489f7c0d681acfd01b2a4a9030ed80a"
    end
  end

  def install
    bin.install "tickit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit --version")
  end
end
