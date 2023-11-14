class Wasmcloud < Formula
  desc "Secure, distributed, WebAssembly actor model runtime for everywhere"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/refs/tags/v0.18.2.tar.gz"
  sha256 "6e393db103047909ee5295abbf95d460614b1a4dbca53fc9dda305451c7b1844"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wasmcloud-0.18.2"
    rebuild 4
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82d2c88138228b6eedcdd4603171720b87538c0c28f2c00293e044f9848d59bd"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/wasmcloud", "-V"
  end
end
