class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.18.1.tar.gz"
  sha256 "9f403c1e1a27eb725c84bcdcb37e6d5fdf16ebe6de54826e3b03333c86ca2baa"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.18.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "6829a39d8e1ac1426a43f58dcd025b5b70bd9708bb6a9b1fbcf9cc48cf6bd6bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d781ce8dd0f780b15fa9019bcf543cccb5d4ac09561d3d315e9f44a76de5b1b5"
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
