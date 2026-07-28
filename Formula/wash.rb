# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.0/wash-x86_64-apple-darwin"
      sha256 "48e57666d8c1958997a5ff44680eb56ae4649b92168779c95a22fe944bd98e7a"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.0/wash-aarch64-apple-darwin"
      sha256 "08419ad300cfc52708f5598dc00be0d5e3a75070e0fdfa3c61f7a0f56352302f"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.0/wash-x86_64-unknown-linux-gnu"
        sha256 "5bf806d8b189a0e6ba6d9a139b9a6213ab72ced8e9353b8abeb0676ec1dcf660"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.0/wash-aarch64-unknown-linux-gnu"
        sha256 "8db09d940fef981711208a692d2d9db83cda691c16f1e6aaed4f9c0715057d90"

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
