class Tickit < Formula
  desc "Terminal-based task manager with CLI and TUI"
  homepage "https://github.com/ricardodantas/tickit"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "75f0b7e820bb78ccd5b07fef16274c41a42711e8ef835d6d01c5f02e9e5751e9"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d3407716cd905a5d20c823a434d2cc828c47c5937a13a984bfebb1c6ef262529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9e99e58a0083204e94351b54f1f949680657d4d2e3d29764b0ff24c35adf3a3"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49ca162402131ff93ec9a416a1143a39db6a2f03da91d9040ab9c17a26e945d8"
    end
  end

  def install
    bin.install "tickit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit --version")
  end
end
