# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.2/wash-x86_64-apple-darwin"
      sha256 "b06dc2f63db812d3400027255e6d56a41b0035802a77e9378c15ad189c9674d3"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.2/wash-aarch64-apple-darwin"
      sha256 "f831ef9527278be27c1f1b35a5246396d1611914f7022ab3cfffa82b088ff978"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.2/wash-x86_64-unknown-linux-gnu"
        sha256 "43e5b65b26e73a71f694e14fba2a4d1b705e6ae3a9461031bd4bf2bf535ee6ca"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.2/wash-aarch64-unknown-linux-gnu"
        sha256 "641bb754c856f8540834bf304b9fdce7862d08a6657180b7503d461843af0065"

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
