class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wascc.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.1.11.tar.gz"
  sha256 "606bf6272f6b8fe3ee4c3c23747162b5432b1bdec176db3f0796190a19886863"
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
