class Wash < Formula
  desc "WAsmcloud SHell - A multi-tool for various wasmCloud interactions"
  homepage "https://wasmcloud.dev"
  url "https://github.com/wasmCloud/wash/archive/v0.11.0.tar.gz"
  sha256 "b3993d4bb4f45f4f6bacb4beef4b76a6e4361542cdadd6d23c04b409b5458e00"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.10.0"
    sha256 cellar: :any,                 big_sur:      "a823acafffdabc2904520e2941f2f710051e02019b8a454e006ff1af023d8eb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "007afe13d5cc8fccd6cd66b73484326561b75b57eb8bbf39412e8b648062de49"
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
