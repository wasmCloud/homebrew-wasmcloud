class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.17.3.tar.gz"
  sha256 "9a5404ef46a38fd531d4cf65569521317b90114e96348e43cf90ec63252214bd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.17.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "ed03b9e1edbe2fab73032dbb009cba8eddd3e7f769c7fcba8a58beb5ef638028"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "28a06a6f9c5464c15a0aaf055bb42d0d6f64de67b256b5aee7ebc3ed33ad9986"
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
