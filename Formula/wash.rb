class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.21.1.tar.gz"
  sha256 "e8ad9b215780c76447f124310e7aba6c10b42bd24a84c80b0de54fd0fffd9324"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.21.1"
    sha256 cellar: :any_skip_relocation, monterey:     "427986add04b16c4376674c1c195ba96a8cb30774ad6c0c6bd35ee4e25ecf490"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf42e42efe71641ec4db79805303cc78fbea4c2473d5775bf90d1d6292f0bebe"
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
