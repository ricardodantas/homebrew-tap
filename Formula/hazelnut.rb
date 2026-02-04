class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  url "https://github.com/ricardodantas/hazelnut/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "3cc73726f8997833030b5cd54bdeb01de038048604e06fb3cbd86dda75e1352a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hazelnut --version")
  end
end
