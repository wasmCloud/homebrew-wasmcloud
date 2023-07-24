class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.19.0.tar.gz"
  sha256 "d752df663c1b1e9dca38588a05080a25f5d6cdf3cb8c5a6a41f207c53f85e560"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.19.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "1f1619182085dafb76edc2915a90b9f02e847154b4288b79a779656d874ed060"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01965823ed432c07d3461e360f12b46076427af102f949bade91a9d97286f362"
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
