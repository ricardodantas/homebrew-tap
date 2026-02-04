class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  url "https://github.com/ricardodantas/feedo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "3972aadb0094a0213000f311a64534558f1e4ff0a8033b17eaf00cd3cb28b367"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
