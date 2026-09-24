# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.1/wash-x86_64-apple-darwin"
      sha256 "7b1bd20bb96eba11a892739fe2af7c4f5fcc146819e8969b9dfbe1cfae4bc36f"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.1/wash-aarch64-apple-darwin"
      sha256 "de60d863fe762d675446238cb35138ff1896d34071640dad08d118fde3af513a"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.1/wash-x86_64-unknown-linux-gnu"
        sha256 "6d88ed422ea1982a3ab7bc70287237089cdf92c1142978f53f3699d3d3fbc80d"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.1/wash-aarch64-unknown-linux-gnu"
        sha256 "dba6e5ed735f31c63ee5a424cd69da65f001219a52a7105d558a6d1d931a7ac2"

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
