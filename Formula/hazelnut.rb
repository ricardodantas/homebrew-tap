class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  version "0.2.45"
  license "GPL-3.0"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b66d68f9c9e578568e29bb653f1d28453e407b5db12068944e7ffbd7802efc5a"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6ec654a3f6a3a09f43884e8ca20f6e190f0a410ae49afe1dfc350da1ef94b001"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "575cb38a2eb0064b8e12423a75ec653b906fd09b436e04597c9247cbd65d65c2"
    end
    on_intel do
      url "https://github.com/ricardodantas/hazelnut/releases/download/v#{version}/hazelnut-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "baf556d7d80519b0b49ac22b7a606acb0e3ec79f2ab7cdbb032ce9edb6a9d167"
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
