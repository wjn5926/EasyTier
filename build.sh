#!/bin/bash
set -eux

# 安装构建依赖，包括 protoc
apt-get update
apt-get install -y protobuf-compiler clang libclang-dev llvm-dev build-essential pkg-config cmake

# 设置环境变量
export LIBCLANG_PATH=/usr/lib/llvm-14/lib
export CC=clang

# 编译项目
cargo build --release --bin easytier-core
