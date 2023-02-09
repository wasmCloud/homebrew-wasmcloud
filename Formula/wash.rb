class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.15.0.tar.gz"
  sha256 "5cbb69ec7f3f170a69098927868d4f425d70861304462ce24783dde249990587"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.14.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "b391979399cd706a872410833fab270ad38fadc9342c45e53e9c13de05a4a434"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a85a8befa8b314763d01a7f761abe70c81a804c6ff0d5c640c6257e52fcbfeae"
  end

  depends_on "rust" => :build

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "wash", "-V"
  end
end
