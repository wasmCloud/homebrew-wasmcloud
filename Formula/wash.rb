class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.20.0.tar.gz"
  sha256 "e5c30d9b2c48b937f964c253d73c97e4916b058c743c6b7c46cc8c69a0e71832"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.20.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "bd6911e61e69ff95ae846da2a02cc32b6672a0631980dbffa7c726e6697ab5bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba3a667f28f1f1f5de184efcf97d021274e4ab62ab8d91179dcf1e0635d67914"
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
