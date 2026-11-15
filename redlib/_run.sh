#!/usr/bin/env bash
set -euo pipefail

if [[ $(uname -m) =~ ^(aarch64|arm64)$ ]]; then
  sed -i \
    -e 's/x86_64-musl/aarch64-musl/' \
    -e 's/x86_64-unknown-linux-musl/aarch64-unknown-linux-musl/' \
    Dockerfile.alpine
  echo 'Patched Dockerfile.alpine for arm64'
fi
