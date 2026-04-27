# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.5/wash-x86_64-apple-darwin"
      sha256 "c533c1a27c22585f709827875c50f62d88c7ef63f5ae12a7f32de42679852e8c"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.5/wash-aarch64-apple-darwin"
      sha256 "9988bae9a10c7d827582084fc6fe7a1bda4d2d272a09b086f2b4746900d950be"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.5/wash-x86_64-unknown-linux-musl"
        sha256 "feca9555613c9f2b4369a9e3df1345fd8bb16d20ff4e6e7e9940fc7d40284761"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.5/wash-aarch64-unknown-linux-musl"
        sha256 "739cbc1e15759b9a0f002cd86687c270f8bb72aa25bf0d791f6f512f6f070091"

        define_method(:install) do
          bin.install "wash-aarch64-unknown-linux-musl" => "wash"
        end
      end
    end
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
