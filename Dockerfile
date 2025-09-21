FROM rust:slim-bookworm

# 安装构建依赖
RUN apt-get update && \
    apt-get install -y clang libclang-dev build-essential pkg-config cmake

# 调试：查找 libclang.so 的实际路径
#RUN find /usr/lib -name "libclang.so"
RUN find /usr/lib -name "libclang.so" || echo "❌ libclang.so not found"


# 设置 libclang 路径（根据上一步输出结果修改）
ENV LIBCLANG_PATH=/usr/lib/llvm-14/lib

WORKDIR /app
COPY . .

# 编译 EasyTier 核心程序
RUN cargo build --release --bin easytier-core

CMD ["./target/release/easytier-core", "-d", "--network-name", "mynet", "--network-secret", "mysecret", "-p", "tcp://0.0.0.0:11010"]
