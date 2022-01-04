class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.7.2.tar.gz"
  sha256 "45e94be657e2906dc6582fa1f1a73d3a8ad494926d0f71eda6a12c094635b44e"
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
