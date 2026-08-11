# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.7.0/wash-x86_64-apple-darwin"
      sha256 "b3e5f8bbef6f5c52002399ed82373b47926aa3f2d4c05374f41f55a78bda8358"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.7.0/wash-aarch64-apple-darwin"
      sha256 "5fb448e04b785ac137e7e53fa03f1f4249f583d3b05ea02e542239e30511d2d2"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.7.0/wash-x86_64-unknown-linux-gnu"
        sha256 "3ae8143c5a93c2cb4b3bd0f7685a8aa02654fbe1430361ccbc839fe1174ac962"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.7.0/wash-aarch64-unknown-linux-gnu"
        sha256 "74f7b5dad4cec0b6b8981391e19ba381af400adf681369ac0860ef867d757c15"

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
