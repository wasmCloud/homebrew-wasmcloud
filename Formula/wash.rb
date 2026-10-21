# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.11.0/wash-x86_64-apple-darwin"
      sha256 "9c287ea9e027f0c2d391400e7897c8e8225109cfee6efaf2e7b238afea233f17"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.11.0/wash-aarch64-apple-darwin"
      sha256 "365d896eaed3894f1c551a1ed7351c2aae9dfa5548ce82041ead92e6253d1954"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.11.0/wash-x86_64-unknown-linux-gnu"
        sha256 "701e6cd698e33916315cb6e1fcbd2e28cabeafe20800e4bd99d231dee09bfd37"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.11.0/wash-aarch64-unknown-linux-gnu"
        sha256 "c3b2204dd99ae2bc46c1236967f4a328cebe3b57d3d5a1605091618eff66bcad"

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
