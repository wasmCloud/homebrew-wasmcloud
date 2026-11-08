# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.1/wash-x86_64-apple-darwin"
      sha256 "120b5687c3d2f236c7a0272e2e1ed44bad112eb6f8fa5e3a8d43f6984f59904d"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.1/wash-aarch64-apple-darwin"
      sha256 "dd5e76833cc61fb2b5c8fa689c6ba9138ecb3fdccd07abbee7290f7e1c9e86be"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.1/wash-x86_64-unknown-linux-gnu"
        sha256 "5e11793301c32924d82276a0217f692ed17f254d3cc56ceffa0483037c713de7"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.12.1/wash-aarch64-unknown-linux-gnu"
        sha256 "9f1e0580bb369f344684ac21c7f7e6b3db12f1dce0b7a46977c24f3471b963d2"

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
