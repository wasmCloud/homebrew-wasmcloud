class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wascc.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.1.14.tar.gz"
  sha256 "13ec345a4467d6f734e74035ac2e64abbe82063ee59ead00d575877b5e2ff012"
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
