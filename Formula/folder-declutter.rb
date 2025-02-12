class FolderDeclutter < Formula
    desc "Folder Declutter is a command-line and library utility written in Rust that helps you free up disk space by automatically deleting files that haven't been modified in a specified number of days."
    homepage "https://github.com/ricardodantas/folder-declutter"
    url "https://github.com/ricardodantas/folder-declutter/releases/download/v0.4.0/folder-declutter-macos-0.4.0"
    sha256 "44e4369d5752597a67638b981d3ccc1ae06d3a7d35ed1d00b73a6debd4b13d40"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    test do
      # This test will run `ghloc --version` and check that it starts with "ghloc "
      assert_match /^folder-declutter /, shell_output("#{bin}/folder-declutter --version")
    end
  end
