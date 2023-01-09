class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.14.0.tar.gz"
  sha256 "8c6a62231a5649167be4fe4d7908b8a4419f437a5bcce600e19e04ec15b7e15a"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.13.0"
    sha256 cellar: :any,                 big_sur:      "7f76b4ffb99d6c7076154c5c4fc4eed9e673294e3c8749bc107a49fb3e102118"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f423993a4072de2a900ed5cba3f8eb0c96e57b2acc541165725d3218162f52d"
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
