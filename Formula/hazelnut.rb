class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  version "0.2.40"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "430575e973f92a0513a917d3b8c4c08b9a0c9337b128485cb83175a1cadc6662"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a9cc2eee87aebc42843d0df2fd2adca68a801345ec4f1405f36b8ad6527ad250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e37deb7ced6c7e5f487590ed7fae2055ad835d31dcbeda4281646095c5350529"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e3d405c0cdb39877e8b35227b04055def7339154805ad47052ee8db1775fa6f"
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
