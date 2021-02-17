class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wascc.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.2.0.tar.gz"
  sha256 "80ef40f4f069eeb08a45ade5817ae18d665bbadb3f39ef937f480ddb1e994212"
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
