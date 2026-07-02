# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.1/wash-x86_64-apple-darwin"
      sha256 "7b03c76256a9d00755a5a3c69b8bae5913d43fa45a210aac3da2558a7cf7825e"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.1/wash-aarch64-apple-darwin"
      sha256 "2c46077f0a8687819544cf7cd5c6e9180d9a069df8a944d59ff8eb34ba8f54d2"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.1/wash-x86_64-unknown-linux-gnu"
        sha256 "abb85540020d85959eda51e97ee4a55f4b14485f32b761e7d638ca2bd2752fd3"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.1/wash-aarch64-unknown-linux-gnu"
        sha256 "fcbcbf466ddd833249df00d0f73f6cc9b917f886dbf239294a14fafe59cdd448"

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
