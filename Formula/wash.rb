# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.9.0/wash-x86_64-apple-darwin"
      sha256 "c1aad65c275fd41d242aec1feedd584482d74f794e12c2e46cb7b22c91da510c"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.9.0/wash-aarch64-apple-darwin"
      sha256 "da2fe400b9b8bfda4bd2513e393803f21469a66cb3c41d889733c21e165add4f"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.9.0/wash-x86_64-unknown-linux-gnu"
        sha256 "590130b23d897e80ba948c15cfd317e946e1b22b73b6d534af57dfec1e4f4bf6"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.9.0/wash-aarch64-unknown-linux-gnu"
        sha256 "8ad34c75e1af74152bd428fe655721b6991a65dea4fe53c58eb9f4f22189e0d3"

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
