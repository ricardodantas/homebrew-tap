class Perch < Formula
  desc "Beautiful terminal social client for Mastodon and Bluesky"
  homepage "https://github.com/ricardodantas/perch"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a76136e834f21b80b989f2b09e77ba2b06fe4e1427f2f81402e2f083da9966cc"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a044b4ad7bdea21bdbbc578ca372ade4214f45dee1105bac07457caea5470d1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a2733f8c3f2dc6bf2922cf3cc5b1a43195095e678ddfb13aa77ef26c3b45c49"
    end
    on_intel do
      url "https://github.com/ricardodantas/perch/releases/download/v#{version}/perch-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5082c56ddbe231c571fad5a77279b64adec0d07808cc7e7297a0caf4977bae8d"
    end
  end

  def install
    bin.install "perch"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/perch --version")
  end
end
