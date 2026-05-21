FROM debian:stable-slim

ARG BAT_VERSION
RUN apt-get update && apt-get install -y wget tar \
    && wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz \
    && tar -xzf bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz \
    && mv bat-v${BAT_VERSION}-x86_64-unknown-linux-gnu/bat /usr/local/bin/

ENTRYPOINT ["bat"]
