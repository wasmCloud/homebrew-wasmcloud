# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.2/wash-x86_64-apple-darwin"
      sha256 "606732ce125154470a24525a2b7df7ee6182e659c3b38fa005d0b600451b313b"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.2/wash-aarch64-apple-darwin"
      sha256 "033f0f2fe309bf5fc70be6779454ca62147edceb2f2242ab21975f76d86ebc8d"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.2/wash-x86_64-unknown-linux-gnu"
        sha256 "fef1e14a645144c84b4518ff5c907510b28dcd050576b80bd2c1d9d0dba6f02a"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.2/wash-aarch64-unknown-linux-gnu"
        sha256 "2c29cc651b87062d60c145942abce022c431710e398c47213f04d59062db4683"

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
