class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.13.0.tar.gz"
  sha256 "23986a2bbd3a6635560bd5ea681b77f0a867a22e2d4af2cefb319b5c9ee7a1d2"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.13.0"
    sha256 cellar: :any,                 big_sur:      "7f76b4ffb99d6c7076154c5c4fc4eed9e673294e3c8749bc107a49fb3e102118"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6f423993a4072de2a900ed5cba3f8eb0c96e57b2acc541165725d3218162f52d"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

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
