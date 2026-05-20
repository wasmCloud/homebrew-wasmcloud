# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.0/wash-x86_64-apple-darwin"
      sha256 "2d5b07cb6b25807a1685e98efdf419c2cea5989397e16652a2dadb1b28e33b94"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.0/wash-aarch64-apple-darwin"
      sha256 "29be82400bbe557552e1cb0e18f0ff4432f40d15c727c680ef0990f188c8df7d"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.0/wash-x86_64-unknown-linux-gnu"
        sha256 "38362b28a021f4714e454f8d1526c4f033f00eb0b3656e07b8f2f01459fdbcd7"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.0/wash-aarch64-unknown-linux-gnu"
        sha256 "8fdc9c453cd2b48f0a460dd8505264f79487db5a5da7e63092b337ed56459634"

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
