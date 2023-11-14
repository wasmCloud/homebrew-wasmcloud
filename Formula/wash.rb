class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.23.0/wash-x86_64-apple-darwin"
      sha256 "3adb9a837ade2658eb7604e15cb8cc9a6c797e39102fc342dd30083dfdd2a5c8"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.23.0/wash-aarch64-apple-darwin"
      sha256 "8b6bb1caa51b9de3ddf338e482da0ecea3cb7327e042fe048dc8077df76e323e"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.23.0/wash-x86_64-unknown-linux-musl"
      sha256 "3ab9e4fe429b425a9fad08991ca7602a7a2c4cd507280196f79b1b398e54a6b7"

      def install
        bin.install "wash-x86_64-unknown-linux-musl" => "wash"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.23.0/wash-aarch64-unknown-linux-musl"
      sha256 "b21ba5f0697ca2ab53684b871e0809d1e3fa51241a1889c2f1b3e6bcd0fb2dd3"

      def install
        bin.install "wash-aarch64-unknown-linux-musl" => "wash"
      end
    end
  end

  test do
    system "#{bin}/wash", "--version"
  end
end
