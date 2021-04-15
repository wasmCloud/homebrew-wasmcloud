class Wasmcloud < Formula
  desc "A secure, distributed, WebAssembly actor model runtime for the cloud, edge, and everything in between"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.17.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
