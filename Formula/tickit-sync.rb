class TickitSync < Formula
  desc "Self-hosted sync server for Tickit task manager"
  homepage "https://github.com/ricardodantas/tickit-sync"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d229b1f1923c5a14b0e01295d4d794c7f2cafcfe8d7047bebd86fb9cb445cd74"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ead53174e379617c9ad861ba4eec2dfe065a8f4e959ee4dfb6c27bd25bbe50f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8df4358d68fbe3efeaa5654c15c9976a53bfad6c5c48c30e9e128d66bf79ae3"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5d35be3d3cfbfc4def0efbdf177531721d5c7ea31445ea256860d2604d21bf7"
    end
  end

  def install
    bin.install "tickit-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit-sync --version")
  end
end
