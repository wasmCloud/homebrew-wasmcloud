# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.0/wash-x86_64-apple-darwin"
      sha256 "b573319de90b0f7cf50bb839f3e92ca75fa6930cc4d2c7579b03967b98cbc306"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.0/wash-aarch64-apple-darwin"
      sha256 "1bb197e7e4b97eef6dff792946e07f8f5a680055ecc1839887e249c2eeb0a8c5"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.0/wash-x86_64-unknown-linux-gnu"
        sha256 "dee88141ab963fa91bf296c03abe7b4cf42c1385d350c7d149d3562cde6345ec"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.0/wash-aarch64-unknown-linux-gnu"
        sha256 "d6d252f3412b4f977057ccb537092e0f0279dc995206c8691a2315571750f2c0"

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
