class Wasmcloud < Formula
  desc "A secure, distributed, WebAssembly actor model runtime for the cloud, edge, and everything in between"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.18.2.tar.gz"
  sha256 "6e393db103047909ee5295abbf95d460614b1a4dbca53fc9dda305451c7b1844"
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
