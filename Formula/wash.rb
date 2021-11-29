class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.7.1.tar.gz"
  sha256 "c2602a85e9745b33145aeaad12957241764bd7d213a77355934cb827f289935a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "-q", "--release", "--bin", "wash"
    bin.install "target/release/wash"
  end

  test do
    system "wash", "-V"
  end
end
