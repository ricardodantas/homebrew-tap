class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  url "https://github.com/ricardodantas/hazelnut/archive/refs/tags/v0.2.15.tar.gz"
  sha256 "12686aa0a2a89d0e33cbb6dda2c117d863d10fb14a32d2830cec1a5e754554c1"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hazelnut --version")
  end
end
