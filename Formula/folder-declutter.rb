class FolderDeclutter < Formula
    desc "Folder Declutter is a command-line and library utility written in Rust that helps you free up disk space by automatically deleting files that haven't been modified in a specified number of days."
    homepage "https://github.com/ricardodantas/folder-declutter"
    url "https://github.com/ricardodantas/folder-declutter/archive/refs/tags/v0.4.11.tar.gz"
    sha256 "1cd7d218cc247844b00406c32a46af53ff6aee41a3dfa4e2763646db68a5b8cf"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      # This test will run `ghloc --version` and check that it starts with "ghloc "
      assert_match /^folder-declutter /, shell_output("#{bin}/folder-declutter --version")
    end
  end
