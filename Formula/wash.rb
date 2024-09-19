# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.33.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.33.1/wash-x86_64-apple-darwin"
      sha256 "de3ca7a60b990f008895b44ce54579a27b7dd764f6c114d10b133361b612d297"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.33.1/wash-aarch64-apple-darwin"
      sha256 "c5dd9389bca9cbdf3fa06e7a7440ec1db20868a4f2b971cba3b593fea6f16f29"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.33.1/wash-x86_64-unknown-linux-musl"
        sha256 "69e5ce3112fa19019160102aa404f490a9f1bd3bf626a03d1bceb619b890e134"

        def install
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.33.1/wash-aarch64-unknown-linux-musl"
        sha256 "945a2361a98b5908b8dd6428e737eb45043c8fe7c5246c07bf9fcc848bb3b8d8"

        def install
          bin.install "wash-aarch64-unknown-linux-musl" => "wash"
        end
      end
    end
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
