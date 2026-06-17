# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.4.0/wash-x86_64-apple-darwin"
      sha256 "e7babaec933b366e74463a7fe388b7a11eda22c27b99057058f430355ce64d58"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.4.0/wash-aarch64-apple-darwin"
      sha256 "3b39c2e0cb4dfefaec70f12152d8a66f0190752b468f6309056bd773c744948f"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.4.0/wash-x86_64-unknown-linux-gnu"
        sha256 "0559c8cc227f3b210424ab83646960524cfbc7ada6b09ca3ce2524517c788021"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.4.0/wash-aarch64-unknown-linux-gnu"
        sha256 "25207e78cd5d1e40b43ac62d7fcef86663930b4bbdd7611f80c16fdd5196ec45"

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
