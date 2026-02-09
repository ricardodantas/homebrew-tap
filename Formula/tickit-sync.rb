class TickitSync < Formula
  desc "Self-hosted sync server for Tickit task manager"
  homepage "https://github.com/ricardodantas/tickit-sync"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "07ec0903ce9bb40079c36e2c6de36517fbe42023fb3af92ddb7cfa0e58eaa20c"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "071f766ce048d767b055f70fe0fda39045b217ae9430969d5b2e77056418720e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f055f6ca5b2f414ded7b82ea0ac968faad15c256abbf592e6b1cb9f2a754c08"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit-sync/releases/download/v#{version}/tickit-sync-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2823c0ed48c7b570d6be3cfdaa9e9803c589f05d305a433f6c2b37c0ec4726c"
    end
  end

  def install
    bin.install "tickit-sync"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit-sync --version")
  end
end
