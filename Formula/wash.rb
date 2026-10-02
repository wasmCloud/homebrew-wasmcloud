# typed: false
# frozen_string_literal: true

class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.3/wash-x86_64-apple-darwin"
      sha256 "c77f02b7df4f2df92857b1fdfe4f62cb20a06b196ae02990031881796384ebc9"

      define_method(:install) do
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.3/wash-aarch64-apple-darwin"
      sha256 "4f1abb0e226ced4ccaff1fa1cbf5fbe510f698c07cf69ac48946c64165375f93"

      define_method(:install) do
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.3/wash-x86_64-unknown-linux-gnu"
        sha256 "0ebfbb131dce33fd88a7c728ed27327c5acd07d113c903e6a7809e674a766074"

        define_method(:install) do
          bin.install "wash-x86_64-unknown-linux-gnu" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/v2.10.3/wash-aarch64-unknown-linux-gnu"
        sha256 "2a61eb0bf52ec0df08adc98d7453632f718c4c2c007b0f3a9d25303a509ec4dd"

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
