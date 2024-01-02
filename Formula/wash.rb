# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.25.0/wash-x86_64-apple-darwin"
      sha256 "1e521278d9cefd143e19b27464ed3215c0b058170924554b77e37b9229304f17"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.25.0/wash-aarch64-apple-darwin"
      sha256 "20f457713e0f480623d0676c6670e473785488203739c455605600dbde097fc3"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.25.0/wash-x86_64-unknown-linux-musl"
      sha256 "0e352f807e245231dc166fa57b825e6651837c58df330ce044b95b3656c874b6"

      def install
        bin.install "wash-x86_64-unknown-linux-musl" => "wash"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.25.0/wash-aarch64-unknown-linux-musl"
      sha256 "0139bbefacbf0b87dbdae4f65ade2b2eea125a44a998c4d64c53338251acdfaf"

      def install
        bin.install "wash-aarch64-unknown-linux-musl" => "wash"
      end
    end
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
