class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  version "0.2.47"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9b93a0208ff48b8b8fa8b3568f4c43e506d43609014ac40a103e969e9d956c6b"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2cb776070d28136d34eb0d99433f8c12896bee506f7be99bdb5aa5c7998a92ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fab7e64324f1dae8f2835491429875eedbe8710b6666064378fb0e645c407edc"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b071f6e2a88c075504a0972b8264a20028a97db16cbd02db5de97d7156e51aaf"
    end
  end

  def install
    bin.install "hazelnut"
    bin.install "hazelnutd" if File.exist?("hazelnutd")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hazelnut --version")
  end
end
