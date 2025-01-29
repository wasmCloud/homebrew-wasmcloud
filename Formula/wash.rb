# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.38.0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.38.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura:      "e6055453d52c9d7584ea27eb785c8b2fe1f48d108490ac90e8451fe55f4e4c63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5615366c029cabdc962b5c503d0a2faba2cf1eab0ae970ff4315bff1bc900c0"
  end

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.38.0/wash-x86_64-apple-darwin"
      sha256 "68b167bbadf17c3807f5b09d7b16287f543f4dc36557f998c307856c09d3aabb"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.38.0/wash-aarch64-apple-darwin"
      sha256 "7fdac7caa9eb3ce8f54447d2e35b37f578555de3ab39b26b59b08eb59e01e4cb"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.38.0/wash-x86_64-unknown-linux-musl"
        sha256 "8bba2463f4e121fdbbebc4046aabe1ade54aa3bd72ba70a57ad4b0e0e657bec2"

        def install
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.38.0/wash-aarch64-unknown-linux-musl"
        sha256 "bab4fad652eaa9bb1e890daa0478ec223aaf448fb72eb00e59014034a3bca345"

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
