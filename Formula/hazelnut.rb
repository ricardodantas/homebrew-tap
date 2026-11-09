class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  version "0.3.1"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c7b18319c2f5b5be9096ae4f0502039e5daad973e32ed9a2050a7c0dd546aa5d"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4b843eb803826faeb00d291e0893b2e9f1c71eda8ca7c98dfd004fb19d7c2a8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a6949b411b32fe4c4a768a8ac87f2bac09844dd00cadeec80df75d6600ec364"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebb8af5a28a0068da347350ac4b0b77a84f5d3f6df314dffc5e1f898ed9465f0"
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
