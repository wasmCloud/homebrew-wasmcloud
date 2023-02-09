class Wasmcloud < Formula
  desc "Secure, distributed, WebAssembly actor model runtime for everywhere"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.18.2.tar.gz"
  sha256 "6e393db103047909ee5295abbf95d460614b1a4dbca53fc9dda305451c7b1844"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wasmcloud-0.18.2"
    rebuild 3
    sha256 cellar: :any_skip_relocation, big_sur:      "1241173c64d48a0c4d1ea518294b745e2529696c76e054b68cd5f10b0029121c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "361e620a885d228b62fdff23583d95064674bb6f0214061610839fcd4a68791e"
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
