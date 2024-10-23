# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Wash < Formula
  desc "WAsmcloud SHell - a comprehensive command-line tool for wasmCloud development"
  homepage "https://wasmcloud.com/"
  version "0.36.1"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/wasmCloud/homebrew-wasmcloud/releases/download/wash-0.36.1"
    sha256 cellar: :any_skip_relocation, monterey: "21ace1b31ac2cadaf07902abe1610ca170906e2bd1bf74223c487dd1b8cc41ba"
  end

  on_macos do
    on_intel do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.36.1/wash-x86_64-apple-darwin"
      sha256 "e07a3c7ce2d2ec2b16c105bd8e3540fdf14c4d705473b10769ea012e4c3f0ead"

      def install
        bin.install "wash-x86_64-apple-darwin" => "wash"
      end
    end
    on_arm do
      url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.36.1/wash-aarch64-apple-darwin"
      sha256 "fbf92aceca54adb8ec6d781196f782e6104b7bd03a40201c69fd9ce7c2074079"

      def install
        bin.install "wash-aarch64-apple-darwin" => "wash"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.36.1/wash-x86_64-unknown-linux-musl"
        sha256 "99b574034e25842f52b51fb8478cf73f0a2afeae1c26960ea6ce59c8dc80354a"

        def install
          bin.install "wash-x86_64-unknown-linux-musl" => "wash"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/wasmCloud/wasmCloud/releases/download/wash-cli-v0.36.1/wash-aarch64-unknown-linux-musl"
        sha256 "a0e220cf69e985f4ce8db384a0ef94f93ac42490dbefcfc3035668bdb4e3e7ac"

        def install
          bin.install "wash-aarch64-unknown-linux-musl" => "wash"
        end
      end
    end
  end

  test do
    system "#{bin}/wash", "-V"
  end
end
