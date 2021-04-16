class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud activities as well as an interactive REPL for a wasmCloud runtime host."
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.4.0.tar.gz"
  sha256 "9c986dfa469cd87e798e0ec69db244af77d59bf3a41407ec36d3d7f51ac5fcdb"
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
