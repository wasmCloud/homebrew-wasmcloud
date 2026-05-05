# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.7/wash-x86_64-apple-darwin"
      sha256 "58dcaf114d18ad3e03b51f4f781c406227ab02e228f2fd4e91e19043fed85be4"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.7/wash-aarch64-apple-darwin"
      sha256 "aa2862546b9657f2a9993444540728ee27213c90cac5131f98aeb05497c64cd1"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.7/wash-x86_64-unknown-linux-gnu"
        sha256 "4715b04477fa36bf60dc52dbfb7dd459f45324a96df494825cd6886025758424"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.7/wash-aarch64-unknown-linux-gnu"
        sha256 "84fc031c8db514166b28a600a7f6359efb4ae1ea0db21de7b45ecc308ecefad9"

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
