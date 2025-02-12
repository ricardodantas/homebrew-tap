class FolderDeclutter < Formula
    desc "Folder Declutter is a command-line and library utility written in Rust that helps you free up disk space by automatically deleting files that haven't been modified in a specified number of days."
    homepage "https://github.com/ricardodantas/folder-declutter"
    url "https://github.com/ricardodantas/folder-declutter/archive/refs/tags/v0.4.9.tar.gz"
    sha256 "b08aac7440cdba4470d08fca2b052f976a675d2a256d2eee1a7cc00612c8f441"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      # This test will run `ghloc --version` and check that it starts with "ghloc "
      assert_match /^folder-declutter /, shell_output("#{bin}/folder-declutter --version")
    end
  end
