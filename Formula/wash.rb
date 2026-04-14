# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.3/wash-x86_64-apple-darwin"
      sha256 "4e75c17b89200af3fab42921d2c7fe2e1071bce24d4daac976c49d0d7d8af90f"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.3/wash-aarch64-apple-darwin"
      sha256 "a2dd50f12ce6d21d8d3b28e3e5f45602ee8e386fe5ff3096c6df9c4471195850"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.3/wash-x86_64-unknown-linux-musl"
        sha256 "7a1cdd6d2a22f0c1c615f396c971440b9f12b7bb0aef6e92f80a1381cc9bc2b0"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.3/wash-aarch64-unknown-linux-musl"
        sha256 "acdfdda68cc18da77b707bb37fdeb6a72747590d570d737a41d35aa58ea198b9"

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
