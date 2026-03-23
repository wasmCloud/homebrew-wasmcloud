#!/usr/bin/env bash
set -euo pipefail

# Generates Formula/wash.rb from release artifacts in tmp/.
# Usage: ./generate-formula.sh <release_tag>
# Example: ./generate-formula.sh v2.0.1

RELEASE_TAG="${1:?Usage: $0 <release_tag>}"

export BASE_URL="https://github.com/wasmCloud/wasmCloud/releases/download/${RELEASE_TAG}"

TARGETS=(
  "aarch64-apple-darwin"
  "x86_64-apple-darwin"
  "aarch64-unknown-linux-musl"
  "x86_64-unknown-linux-musl"
)

for target in "${TARGETS[@]}"
do
  file="tmp/wash-${target}"
  if [[ ! -f "${file}" ]]
  then
    echo "Error: expected artifact not found: ${file}" >&2
    exit 1
  fi
done

export SHA_AARCH64_APPLE_DARWIN
SHA_AARCH64_APPLE_DARWIN=$(sha256sum "tmp/wash-aarch64-apple-darwin" | cut -d' ' -f1)
export SHA_X86_64_APPLE_DARWIN
SHA_X86_64_APPLE_DARWIN=$(sha256sum "tmp/wash-x86_64-apple-darwin" | cut -d' ' -f1)
export SHA_AARCH64_UNKNOWN_LINUX_MUSL
SHA_AARCH64_UNKNOWN_LINUX_MUSL=$(sha256sum "tmp/wash-aarch64-unknown-linux-musl" | cut -d' ' -f1)
export SHA_X86_64_UNKNOWN_LINUX_MUSL
SHA_X86_64_UNKNOWN_LINUX_MUSL=$(sha256sum "tmp/wash-x86_64-unknown-linux-musl" | cut -d' ' -f1)

# shellcheck disable=SC2016
envsubst '$BASE_URL $SHA_AARCH64_APPLE_DARWIN $SHA_X86_64_APPLE_DARWIN $SHA_AARCH64_UNKNOWN_LINUX_MUSL $SHA_X86_64_UNKNOWN_LINUX_MUSL' \
  <Formula/wash.rb.tmpl >Formula/wash.rb

echo "Generated Formula/wash.rb for wash ${RELEASE_TAG}"
