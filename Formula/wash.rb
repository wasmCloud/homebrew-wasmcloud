# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.6/wash-x86_64-apple-darwin"
      sha256 "06aae1d8360772390887728cfc4b2e89837b42604f8f9944cb83b507f86c78af"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.6/wash-aarch64-apple-darwin"
      sha256 "c50bb740d40b0841410ed7c3fff3f4d80b1c2a72a215161ef45af459dbad5761"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.6/wash-x86_64-unknown-linux-gnu"
        sha256 "1a55c80d630c6038c34f2709d4ca09176972c7da28dc134484e57e1043e1a61f"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.6/wash-aarch64-unknown-linux-gnu"
        sha256 "c6f00c9c5f04a495006c08ab7cb9db0954b19164a32ae0cbd5f4794e68303b06"

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
