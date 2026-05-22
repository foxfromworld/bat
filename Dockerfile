FROM rust:1.88-slim

ARG BAT_VERSION
ENV BAT_VERSION=${BAT_VERSION}

RUN apt-get update && apt-get install -y wget tar build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/foxfromworld/bat/archive/refs/tags/${BAT_VERSION}.tar.gz && \
    tar -xzf ${BAT_VERSION}.tar.gz && \
    cd bat-${BAT_VERSION#v} && \
    sed -i "s/^version = \".*\"/version = \"${BAT_VERSION#v}\"/" Cargo.toml && \
    cargo build --release && \
    mv target/release/bat /usr/local/bin/bat && \
    ln -s /usr/local/bin/bat /usr/bin/batcat && \
    cd .. && rm -rf bat-${BAT_VERSION#v} ${BAT_VERSION}.tar.gz

ENTRYPOINT ["bat"]
