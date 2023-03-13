class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.16.0.tar.gz"
  sha256 "1ee9ddc98508e9189395485597cc872e4974edf3cb9e32dd3834a817a322032b"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.15.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "3f629847a16c9b089f8a947bc27875d18414b71172fbeacec8da88c19d538942"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "243e06d7f14370ab9a14db8e357767e3eb3416e83041ba6aaada9d83e32b3d3f"
  end

  depends_on "rust" => :build

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
