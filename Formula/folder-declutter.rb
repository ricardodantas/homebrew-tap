class FolderDeclutter < Formula
    desc "Folder Declutter is a command-line and library utility written in Rust that helps you free up disk space by automatically deleting files that haven't been modified in a specified number of days."
    homepage "https://github.com/ricardodantas/folder-declutter"
    url "https://github.com/ricardodantas/folder-declutter/archive/refs/tags/v0.4.14.tar.gz"
    sha256 "5ba74ab07244782d9058c5d6dea4bb9ae3e9d4f072a928543f7b79fbcf17da15"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      # This test will run `ghloc --version` and check that it starts with "ghloc "
      assert_match /^folder-declutter /, shell_output("#{bin}/folder-declutter --version")
    end
  end
