class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  url "https://github.com/wasmCloud/wash/archive/v0.20.1.tar.gz"
  sha256 "4b59baae32930cda54a084fcaad7026cc4dc89a34b191ed4f23abf73ee88cc65"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.20.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "5791ac76563cf5f62d24dd31a5576d36e42465ee078cc9b558913d6c1ac4d5da"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ab0c51c21afbf0a84a8a89b9d54316a57fe376e978227b905a2c97517ac8068d"
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
