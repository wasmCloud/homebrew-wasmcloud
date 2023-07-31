class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.19.1.tar.gz"
  sha256 "ca635c1163c4a5b9b288021455d06578c09a3e2e8db4726a3954ce887243f7ee"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.19.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "9440cc6b06d69a11eddd22d637cc4aeee988ba0c425cb93af5d61fa01a9d0443"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93cfac4fe36e2abb53ee665637926aa839d5ab687b07bbef9793cc7a611bc06e"
  end

  depends_on "rust"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
