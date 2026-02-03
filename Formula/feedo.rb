class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  url "https://github.com/ricardodantas/feedo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c5af14af36a99b3496b52c76f60ae48f761ed9eb8bc214691cf9d55956e9e7fc"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
