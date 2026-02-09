class TickitSync < Formula
  desc "Self-hosted sync server for Tickit task manager"
  homepage "https://github.com/ricardodantas/tickit-sync"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "73823a5860feaeaf68392a102f1da079e13c033a9b4d855cb1a0fedf7b22611d"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e0622a2a463cf97a03371756161a2ea3e35559664dc64949602b578a365ec402"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0bd830ee82e92411f806aa84d0ce02ef9b9b0840e3c621c75e4d53c18b9757db"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "974c979ce283ebf00169d9d832263781afe3806b2c3dd65789c443cf1b98569a"
    end
  end

  def install
    bin.install "tickit-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit-sync --version")
  end
end
