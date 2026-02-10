class Perch < Formula
  desc "Beautiful terminal social client for Mastodon and Bluesky"
  homepage "https://github.com/ricardodantas/perch"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "572e31db25f2d90af9a3154ba94ec346dc995150b496314c719decd2107046d7"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "deaf7588ae6fefac9138f8580563502bc4f6aa57f0a5a3107ec5bf71fc2a1f74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a49fe64de24e65344b7310dcff2958048946c59702201d1c3a5c80c7df077ac9"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b19646e4d3314f33a0e848025dc27245f22e2cbb599d6e2569efe4dfb6c3da3d"
    end
  end

  def install
    bin.install "perch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perch --version")
  end
end
