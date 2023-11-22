#!/usr/bin/env bash

go_arch=$1
go_os=$2
output_path=$3

# Make Go -> Rust arch/os mapping
case $go_arch in
    amd64) rust_arch='x86_64' ;;
    arm64) rust_arch='aarch64' ;;
    *) echo "unknown arch: $go_arch" && exit 1 ;;
esac
case $go_os in
    linux) rust_os='unknown-linux-musl' ;;
    darwin) rust_os='apple-darwin' ;;
    windows) rust_os='windows' ;;
    *) echo "unknown os: $go_os" && exit 1 ;;
esac

# This deletes the output path before we attempt to place the Rust binaries there,
# so that in the case we fail to download or `find` the Rust binaries below, the
# pipeline will fail and we can investigate.
rm "${output_path}"
# Find the artifacts in tmp/ and move them over to dist/ where the Go binaries would be.
find tmp -type f -name "*${rust_arch}-${rust_os}*" -exec mv {} "${output_path}" \;