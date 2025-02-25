# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.39.0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.39.0"
    sha256 cellar: :any_skip_relocation, ventura:      "5c13b8ccc65984811a2eed5c2aca6b5d172206fafd74059705d889498cfaf671"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f65e2375d93d0b615077c2c0789c3aaecb207e05117658426e629ada2618359"
  end

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.39.0/wash-x86_64-apple-darwin"
      sha256 "b96c77148758fb3c8ae74f94f13c3e95a526c592d125ae61d3a6d36bc438f21c"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.39.0/wash-aarch64-apple-darwin"
      sha256 "7805d1c2a6b7b76181329737555bd9a70cc6b006ea67de81d97ce2d5a40c5d3c"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.39.0/wash-x86_64-unknown-linux-musl"
        sha256 "7cfc3a7c62db1cffa93c92c8f42be9fb10525cde1354e38531508c7500170cf8"

        def install
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.39.0/wash-aarch64-unknown-linux-musl"
        sha256 "279efdd262c9ea25a21b6f9b89eec67aae6583776b4f99e8c72fc3a15ce848c0"

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
