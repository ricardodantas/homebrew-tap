class TickitSync < Formula
  desc "Self-hosted sync server for Tickit task manager"
  homepage "https://github.com/ricardodantas/tickit-sync"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e9a6dd074347c4d8d8be78d285f95822be52016019830701d7a199e4d241898d"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "685773cbf9f9f120df261134b8c3148b3583646059e8271c6d7568eb71e141b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad6a1d4b530a957e8a88d809e1d46cb3458cf6a066d1a2f8aff2016f2c1a0c9d"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d21293b4aa55e41db5031ff32213cdf2558b2a6221f29b0ce1f7d93b7d33605"
    end
  end

  def install
    bin.install "tickit-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit-sync --version")
  end
end
