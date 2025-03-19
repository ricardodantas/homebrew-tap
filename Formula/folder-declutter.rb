class FolderDeclutter < Formula
    desc "Folder Declutter is a command-line and library utility written in Rust that helps you free up disk space by automatically deleting files that haven't been modified in a specified number of days."
    homepage "https://github.com/ricardodantas/folder-declutter"
    url "https://github.com/ricardodantas/folder-declutter/archive/refs/tags/v0.4.13.tar.gz"
    sha256 "9e4a1b148656880b12863f0ac86fc1d9d13d3cc74fd6ee5fb14fc0ee1651000d"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      # This test will run `ghloc --version` and check that it starts with "ghloc "
      assert_match /^folder-declutter /, shell_output("#{bin}/folder-declutter --version")
    end
  end
