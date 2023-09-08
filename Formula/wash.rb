class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.20.2.tar.gz"
  sha256 "b55b67f65f7f5e2cd0ed785514be8dfc43a5f64f436806e135b8b1b7ffe5a579"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.20.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "8ac5ec07e1319105f29e49bb1482bb240d9cb4ff24e7b7e69da5e78565126e70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b49e003d88ab3cc194ecb01a5c087cab23bd3881b5679a9ea88e5824e2393d34"
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
