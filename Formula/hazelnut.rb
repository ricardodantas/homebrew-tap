class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  version "0.2.41"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4008ec2c4225fb030ca7609e59d67a00d949d623a47313cf411f9b317bc3d424"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "20dc5acd6b15b0fa46b06e5d4f59124bc3d6913bef93a75c5fd8d07b7e30d7b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2037a8a759dbd943ae47531c5e931983d083669ec1a4cfb8b92e07596f2de6a"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5db7be17eb92059e4475e0314d2cd7332fabd041393ee6f98c58fc92b7da830"
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
