# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.3.0/wash-x86_64-apple-darwin"
      sha256 "d794a286244b3499c3975c49f3ef762b685792df7e0b2c1043a542820498a860"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.3.0/wash-aarch64-apple-darwin"
      sha256 "7ca11fcfa95c7051d618eb2f30becd5f5999429e97fa45789bda4622999b1cf7"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.3.0/wash-x86_64-unknown-linux-gnu"
        sha256 "8b54c5516737e918aabc61ccc80992c06b1feeda6069d3405c23b09ddff5f6a8"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.3.0/wash-aarch64-unknown-linux-gnu"
        sha256 "17196d72c0464d60d34a195044c167d4aae41b5d51c419ea1ddb9ab1c5c8bcb4"

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
