class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.7.0.tar.gz"
  sha256 "7214635688aae4ae06755fd482c767f5db4571ac9d82c0141d02eab34ba64298"
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
