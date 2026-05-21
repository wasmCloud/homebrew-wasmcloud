# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.1/wash-x86_64-apple-darwin"
      sha256 "5d912090d05b956f73a6c83366915a257dcffc1ed6fad86c19f254890917bfa8"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.1/wash-aarch64-apple-darwin"
      sha256 "4287ad3041ecbb572e0a190d085fba5c24e645b2ab3bee06fbcae17c438d508e"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.1/wash-x86_64-unknown-linux-gnu"
        sha256 "5cf94680e5f6f31429fbdd6763f52d08cacd062becc3715dd15353541da9f50d"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.2.1/wash-aarch64-unknown-linux-gnu"
        sha256 "b72cf54f17137d3288acf420ec44836e9c1f5372bce6d6a29b951099fd89f15b"

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
