class Tickit < Formula
  desc "Terminal-based task manager with CLI and TUI"
  homepage "https://github.com/ricardodantas/tickit"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b75b0b22249312b9f0fd68b7bb28ff078452753930f0677e602385ab4993f547"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "da3f9b0febf43cf55b0c69ce6b22cb8d8043134f743922a84bbf810f3ec60f64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "daa0b3a21b7a95d13de89bb4342877f53b819b49f4cd43ae3385f4239edc0d4c"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "85eb0b0d3b03383c7abcbc1f8621a33daaab7763f438dbe12f21be4d4ce1954c"
    end
  end

  def install
    bin.install "tickit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit --version")
  end
end
