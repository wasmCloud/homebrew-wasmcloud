class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.19.0.tar.gz"
  sha256 "d752df663c1b1e9dca38588a05080a25f5d6cdf3cb8c5a6a41f207c53f85e560"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.17.4"
    sha256 cellar: :any_skip_relocation, big_sur:      "6779804593d697ac4b43c501c45ebe04ce3f42cac1e2f9f89f481d20ac5f9dac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c202386e8f361a790f5416193b38888ab18453826f52db74d691c09afbe3e3f"
  end

  depends_on "rust"

  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
