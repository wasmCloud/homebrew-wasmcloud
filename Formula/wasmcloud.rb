class Wasmcloud < Formula
  desc "Secure, distributed, WebAssembly actor model runtime for everywhere"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wasmCloud/archive/v0.18.2.tar.gz"
  sha256 "6e393db103047909ee5295abbf95d460614b1a4dbca53fc9dda305451c7b1844"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wasmcloud-0.18.2"
    rebuild 2
    sha256 cellar: :any_skip_relocation, big_sur:      "6c3e0f735c5b1a8d769d8496ec8ac687d6d4834f4e7b9f491ac56813ad0f827b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5ab43acb615aa49c02456c6004125c0bbb336e6f7c1e9d8fd18d1254c56ac39b"
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
