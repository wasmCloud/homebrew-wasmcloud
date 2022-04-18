class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud interactions"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.10.0.tar.gz"
  sha256 "23089d880c5ee8bf3a281638b2e3aeb24359d87287c8d6e10cb0572a6f5eb9b9"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.9.0"
    sha256 cellar: :any,                 big_sur:      "59505a1bf398032fcc422b4f611697c4a9936cf81e77ad26e6aac0129aca267b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "00855b6e454dba59c43f6135a3370f86e788c8a36f83ab55013ee74e95ddbc9f"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "wash", "-V"
  end
end
