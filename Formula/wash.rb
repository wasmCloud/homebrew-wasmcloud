class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.17.3.tar.gz"
  sha256 "9a5404ef46a38fd531d4cf65569521317b90114e96348e43cf90ec63252214bd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.17.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "5bf9a9a6443770c07be720d9bbfd82f11f56800ccbca0ff63ee9b2e36d264cf3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c87fd993ac85a0a64c3472a4ecf11a0f308fa30d88410aaf34e622efc684672a"
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
