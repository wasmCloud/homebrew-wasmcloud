# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.3/wash-x86_64-apple-darwin"
      sha256 "82eac637b39151bd71e7f6706ce5448928e0e0cbce64bf51617b776a374fd849"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.3/wash-aarch64-apple-darwin"
      sha256 "8b25a3ca148f89edfa0c1fad37423371aa5589deb11d46ba69dc225abbe11d45"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.3/wash-x86_64-unknown-linux-gnu"
        sha256 "7a7c8362a240d78bea7c63b185e61cfa5f050e8fb4f108a3d5e3f9ef7ff7b322"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.3/wash-aarch64-unknown-linux-gnu"
        sha256 "768824cfcc38aebe11d8e5c41fc38e57290e327a39d01fd768b44080f5ba5d65"

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
