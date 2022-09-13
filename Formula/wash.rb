class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.12.0.tar.gz"
  sha256 "ce0e7f796e54ab66c2f91efbeb35b27e92a787e674dee8a6f140bee267ace269"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.11.0"
    sha256 cellar: :any,                 big_sur:      "c3fa9cf211f7f9eb91e5220d4ef17fe802d70a4a9d36fc4073dc15ca24a24889"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "38013bc0300898d724b91d3d226a29d99a09894e10ae09502b31fbc72a215052"
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
