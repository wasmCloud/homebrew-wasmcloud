class Wasmcloud < Formula
  desc "A secure, distributed, WebAssembly actor model runtime for the cloud, edge, and everything in between"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.16.0.tar.gz"
  sha256 "99ad0219b1ac23d6ce0956c4527dfde08b8e6775d9cda471ee389ba1ca0c2c54"
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
