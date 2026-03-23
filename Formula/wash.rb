# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.1/wash-x86_64-apple-darwin"
      sha256 "b6cd769e364be075310833682f375b3c069e3386e574dd6f84834fa1116302da"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.1/wash-aarch64-apple-darwin"
      sha256 "678eb52a0f268064d550629b6a6e867f175ff2035c657e4e412feb2058244646"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.1/wash-x86_64-unknown-linux-musl"
        sha256 "3802c552ab823b4e39ba9705efcef1353e49e3780f095d1c7236505296428607"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.0.1/wash-aarch64-unknown-linux-musl"
        sha256 "362c8137aab08cf3f122039c98e23fc418c91e2bd75b0d66fb354d393433828e"

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
