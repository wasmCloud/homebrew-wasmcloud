class Wasmcloud < Formula
  desc "A secure, distributed, WebAssembly actor model runtime for the cloud, edge, and everything in between"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.18.1.tar.gz"
  sha256 "91bf8fe436976166eb6b860dc097da498dbca8536824809fa08914b4d59b64d0"
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
