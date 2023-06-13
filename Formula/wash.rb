class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.18.0.tar.gz"
  sha256 "440be89bac50d2f3b07bfd1d6722cf0159f99a69f1495deb20cba9810d792392"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.18.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "536b5679c6be1b6c043905be80955672f4a4d919c34ffdce91d76e1a28a7bf09"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1fe21b78227d35ab9018e7e5bc5451d5248d0ae26a6115482e518f4ab9f5ea5f"
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
