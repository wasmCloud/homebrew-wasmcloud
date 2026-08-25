# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.8.0/wash-x86_64-apple-darwin"
      sha256 "acacee088d4958aa859266f7f9a98277fe5a5642e07f531f70af04c95ba75f12"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.8.0/wash-aarch64-apple-darwin"
      sha256 "3c0a5ec33ccc748caeadd1c8300f88a0e378181dc812902fcb896dcbc076140e"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.8.0/wash-x86_64-unknown-linux-gnu"
        sha256 "e676cccd9968494e02cf0f91bb10b1b30ab814e016a85c3cb135ef261bf18fe1"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.8.0/wash-aarch64-unknown-linux-gnu"
        sha256 "1a0b0fc6ace314edc1a2f71d01e9ed5d9d8dda574191bfc2713c626a77663cf0"

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
