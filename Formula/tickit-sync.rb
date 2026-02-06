class TickitSync < Formula
  desc "Self-hosted sync server for Tickit task manager"
  homepage "https://github.com/ricardodantas/tickit-sync"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "40db0c08d547af388bd8f1b3ae364e43353fa2e49f5795b988cae252308eb450"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a64c9753db95996b9f38a5a86c73002eaaacf4c7ff7c3e6060e0149a79a0da50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a2be53e79daa3ea0c49d537dcd09c75fdd02a017e029a8baa0c1f2eb3b17455"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d4ec00f2ad76249e629aef8b06947c64ace1e8c6c924edbcca26d8e2ef99cff"
    end
  end

  def install
    bin.install "tickit-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit-sync --version")
  end
end
