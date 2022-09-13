class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.12.0.tar.gz"
  sha256 "ce0e7f796e54ab66c2f91efbeb35b27e92a787e674dee8a6f140bee267ace269"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.12.0"
    sha256 cellar: :any,                 big_sur:      "5902c8863ecc6b887973053a018e7a21965bfa965ce09a9b0a35cc18df778927"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "16defcf3097193c1ed28f918799014f6176cc942fc1e8a50955dad323b469192"
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
