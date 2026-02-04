class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  url "https://github.com/ricardodantas/hazelnut/archive/refs/tags/v0.2.9.tar.gz"
  sha256 "7912773ac61cdfcf4ea37d54f055b531a22d9f78c066d5a5c81e90600ff57bcd"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hazelnut --version")
  end
end
