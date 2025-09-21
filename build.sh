#!/bin/bash
apt-get update && apt-get install -y clang libclang-dev llvm-dev build-essential pkg-config cmake
export LIBCLANG_PATH=/usr/lib/llvm-14/lib
export CC=clang
cargo build --release --bin easytier-core
