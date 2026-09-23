# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.0/wash-x86_64-apple-darwin"
      sha256 "c2d95031a23cca0eb7100ad88324133ca1e5fa23c6f4f9f8c3519abc571d861f"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.0/wash-aarch64-apple-darwin"
      sha256 "51711273cb68fdce57a45667b527ad41731f7bdf52794952826d881ae352be15"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.0/wash-x86_64-unknown-linux-gnu"
        sha256 "64f8e61d352fa8102569bea7333e4d86e09bdfe718e800cef7a7ca2fedc5880a"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.0/wash-aarch64-unknown-linux-gnu"
        sha256 "5ae111af3ea6f6975373bc95ef83a18a10b2d349d18286fac2dbad167a7846ab"

        define_method(:install) do
          bin.install "wash-aarch64-unknown-linux-gnu" => "wash"
        end
      end
    end
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
