# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.1.0/wash-x86_64-apple-darwin"
      sha256 "db51125ab1eb970da4d8b7eec33291285f3c528e39bd1434dedec7c662db296f"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.1.0/wash-aarch64-apple-darwin"
      sha256 "f35893fa2924093ef095e5d037e06398d48100b8380934749bc1b46a6de9b569"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.1.0/wash-x86_64-unknown-linux-gnu"
        sha256 "c9c637a55c6fce7cecb2411db62e36036d5534b818e694cfb28d033adc232f9b"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.1.0/wash-aarch64-unknown-linux-gnu"
        sha256 "18ab81774b806e323b5f967a3f23dd5fc12dad8ca57bfda6bae57c3675881697"

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
