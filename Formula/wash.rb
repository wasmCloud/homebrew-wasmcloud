class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.8.0.tar.gz"
  sha256 "4c8f1153484dbc47cec93278410bd3e62f1b0f2a3c46f22102d0caec2ca4b3b0"
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
