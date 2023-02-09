class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.15.0.tar.gz"
  sha256 "5cbb69ec7f3f170a69098927868d4f425d70861304462ce24783dde249990587"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.15.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "7c17b8f8ad455382abdb0a4fecdc5906e729b4a43772409a67ba9a461fdcf291"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85c44a20d6291dcf9012979621095c3d4095885b809aa3a9a81014400794ef7e"
  end

  depends_on "rust" => :build

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
