class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.16.1.tar.gz"
  sha256 "66b8b270a9b71ace37393544ed67b89e7446825bf89622bb86710b5bfc55f653"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.16.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "b5c15d1208bfb6c77009e0c99678a6764c3d7f9c669ad33b153cc0cf65fd6e99"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b5c1d99f8a007419dc9e46dd777db523ee5b1312909f97e01920d3c6c8785df"
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
