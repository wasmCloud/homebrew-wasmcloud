# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.1/wash-x86_64-apple-darwin"
      sha256 "342807e95129a3426ca55ff43e5b72255ba723aba9202dc45245517cf5013275"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.1/wash-aarch64-apple-darwin"
      sha256 "b7288fd16f4fdfb32d1b81e1b382110c6ea5da34240394262f7712994b74992f"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.1/wash-x86_64-unknown-linux-gnu"
        sha256 "427481420f6b4320e23e5b373281c6d15cdb9f129e4675550860da44e99fe431"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.6.1/wash-aarch64-unknown-linux-gnu"
        sha256 "66ac821de7b1ef2446de4907cd77b76a22ff9b53c2f281c30e8bc5eb11b12641"

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
