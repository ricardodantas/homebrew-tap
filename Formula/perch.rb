class Perch < Formula
  desc "Beautiful terminal social client for Mastodon and Bluesky"
  homepage "https://github.com/ricardodantas/perch"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "17e361ae161d4a8ec239cf7f42b00770bd8192e34e9e7097795f1a4eecf8e13b"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5bbf6ef5bfda15d8825378284b7b520562f071fb32816bd9f2d11ae5a6bea14b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b02ba1667f0a97cb6a9bd947ba76e596608e9099f26bf050f7b4810d169a1f2a"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b6a9203aedb86e3f95812dc0a0c0a2a46d1a00e8332dc3b418cfad18b25bc27"
    end
  end

  def install
    bin.install "perch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perch --version")
  end
end
