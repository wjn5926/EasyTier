FROM rust:slim-bookworm

# 安装构建依赖，包括 libclang、C 工具链、cmake 等
RUN apt-get update && \
    apt-get install -y clang libclang-dev build-essential pkg-config cmake

# 设置工作目录
WORKDIR /app

# 拷贝项目文件
COPY . .

# 编译 EasyTier 核心程序
RUN cargo build --release --bin easytier-core

# 启动服务（你可以根据需要修改参数）
CMD ["./target/release/easytier-core", "-d", "--network-name", "mynet", "--network-secret", "mysecret", "-p", "tcp://0.0.0.0:11010"]
