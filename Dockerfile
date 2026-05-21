FROM debian:stable-slim
RUN apt-get update && apt-get install -y bat \
    && ln -s /usr/bin/batcat /usr/bin/bat
ENTRYPOINT ["bat"]
