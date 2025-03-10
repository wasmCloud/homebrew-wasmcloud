# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.40.0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.40.0"
    sha256 cellar: :any_skip_relocation, ventura:      "65c18e1c76e531ced7ec37ec9c7c053d898e2babbdecc3da6f1b1ca1f84065ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "098d9bf74679601465282bf39b9d00130b7ef99667e786551854a27d71727f1f"
  end

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-v0.40.0/wash-x86_64-apple-darwin"
      sha256 "a840c5f710d15a5b992256b0a8ede74f5905acfc93fdd3b58653a56efed70c4d"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-v0.40.0/wash-aarch64-apple-darwin"
      sha256 "1ca3ac67d62689f14b8c65317e3cf012513dfa5c1c545e5685c4e0d6ec22cd18"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-v0.40.0/wash-x86_64-unknown-linux-musl"
        sha256 "6f4cc68f74e6736801aac43a3c53532bdd256c66d4ab8db5ba56cd3e99b5e996"

        def install
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-v0.40.0/wash-aarch64-unknown-linux-musl"
        sha256 "feebc84b250a9080130f349bee71fd2270f246d30d0cda534bb3dd07e747cdae"

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
