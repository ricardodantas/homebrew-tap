class Feedo < Formula
  desc "A beautiful, fast, and modern terminal RSS reader built with Rust"
  homepage "https://github.com/ricardodantas/feedo"
  version "1.1.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "08543ccda5a9d0d9e8e19559c5e2119bfcd75e41ee1244e1f74749956b93a5d6"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d7ccd927c8c02d701bee80da233e419d49982027dceb621bf8ecd20fdb611ebf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d2fa55d09d2e659131c21b8fb7377ff0268f4f71ad40e1e8cfa06f13ff4efea"
    end
    on_intel do
      url "https://github.com/ricardodantas/feedo/releases/download/v#{version}/feedo-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a3d1479155d440c91a96143a7d5d365441ffb6fca46617fabab7f9ff4c1a9d8"
    end
  end

  def install
    bin.install "feedo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/feedo --version")
  end
end
