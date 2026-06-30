# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.0/wash-x86_64-apple-darwin"
      sha256 "3c8491d99482a07481dd7d47086714d7e3d3ae4c043e226057127ef4c497d514"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.0/wash-aarch64-apple-darwin"
      sha256 "c7bdf42fd5f9cd63738b701c810b259a9af052daf5854e4b268dec2a69a65d8c"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.0/wash-x86_64-unknown-linux-gnu"
        sha256 "c1cb9a4cd2d3851efa082d91fd4f45ad48916dd8ed08490845583c3652773000"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.5.0/wash-aarch64-unknown-linux-gnu"
        sha256 "be0eb389b564c72ecec8f4f76c0455745ddb6aa5e0fd660af4888b9b28e35b8a"

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
