# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.2/wash-x86_64-apple-darwin"
      sha256 "0ef2a0acfad80d47363e70667f1adcb6090e81237f70d77a233760354c6a7a54"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.2/wash-aarch64-apple-darwin"
      sha256 "a47c42024637fe99faeda56290ef48aed5b3200d35b3438908dafe403cb516e0"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.2/wash-x86_64-unknown-linux-gnu"
        sha256 "f3a7a5bfb771c1c38799eb258a4406ad2b59a63c80accbef5778ad20aca76168"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.2/wash-aarch64-unknown-linux-gnu"
        sha256 "f8c5a5e8dace28800f8d5b857120afe0044fae9c3a0c5f2b5bda354a9c120be4"

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
