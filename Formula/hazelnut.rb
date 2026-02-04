class Hazelnut < Formula
  desc "Terminal-based automated file organizer inspired by Hazel"
  homepage "https://github.com/ricardodantas/hazelnut"
  url "https://github.com/ricardodantas/hazelnut/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "d915c611911c65afd17049eceb0814a8a3a483c9a11cad7c67ffbb81d2b8670b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hazelnut --version")
  end
end
