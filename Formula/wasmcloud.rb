class Wasmcloud < Formula
  desc "Secure, distributed, WebAssembly actor model runtime for everywhere"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.18.2.tar.gz"
  sha256 "6e393db103047909ee5295abbf95d460614b1a4dbca53fc9dda305451c7b1844"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wasmcloud-0.18.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, big_sur: "944e4d0cc0d2481a0bfd7c4a92b7db78ae1b71464db9fc417f383ffd7ad449cd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "wasmcloud", "-V"
  end
end
