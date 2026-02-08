class Tickit < Formula
  desc "Terminal-based task manager with CLI and TUI"
  homepage "https://github.com/ricardodantas/tickit"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "45aef4408cc7108b300192164278a53f5905f818b4c0c9a1efa947408eb348eb"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "46266f37b580dc9b6230c7ae66506b075429b82b9621fea1f37425d0f4009845"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c81bbba2c1ea773cacf51b93f9fa023b9949bc3477af0e9271a88c3740d20be6"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9d16c327dfd03aa7e49e771b2a9dc32ddd7a0854aa08465d9b95eb1276df061"
    end
  end

  def install
    bin.install "tickit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit --version")
  end
end
