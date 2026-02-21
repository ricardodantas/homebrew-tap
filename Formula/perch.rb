class Perch < Formula
  desc "Beautiful terminal social client for Mastodon and Bluesky"
  homepage "https://github.com/ricardodantas/perch"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c418e2e708dc77db7acade5ad36b36f606dfd76f6a3d7da762a489da0ff51fbc"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a3a60dde33e5d9de9efe5f32138c3d79f1fdeef46ad9d017ad014033c7ba396d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1794e6df9ddb7cf3226aa2631e81fbcdf6c84907ba8a031719163c2f1ade0a07"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25558cf04aa63be128af9e3563458a96143260be572364c4da5425d2fe29e338"
    end
  end

  def install
    bin.install "perch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perch --version")
  end
end
