class Wasmcloud < Formula
  desc "A secure, distributed, WebAssembly actor model runtime for the cloud, edge, and everything in between"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.16.1.tar.gz"
  sha256 "b7129764284674c917b7aea1bb28e6ac448644cc6de1e597e866e1b734d65367"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "-q", "--release", "--bin", "wasmcloud"
    bin.install "target/release/wasmcloud"
  end

  test do
    system "wasmcloud", "-V"
  end
end
