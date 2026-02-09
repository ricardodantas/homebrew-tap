class Tickit < Formula
  desc "Terminal-based task manager with CLI and TUI"
  homepage "https://github.com/ricardodantas/tickit"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "689965ced3b414c569989e42dd67cdd454d949abfd9510ba3ac51563b2fa8096"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "962b8736092225959cd22d556b211e220da7446085ed07fb30708282769fa399"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8373e28b8f12f59f2e09cd731b74f648143f220c879e0eceb1d84e5451ec9cf9"
    end
    on_intel do
      url "https://github.com/ricardodantas/tickit/releases/download/v#{version}/tickit-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3afa0f5660294f5288d2f647c66a3bdbf23621c3189021e87e03228ccc199434"
    end
  end

  def install
    bin.install "tickit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tickit --version")
  end
end
