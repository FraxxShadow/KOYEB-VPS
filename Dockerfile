FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y wget curl ffmpeg python3-pip ca-certificates && \
    wget https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 && \
    chmod +x ttyd.x86_64 && mv ttyd.x86_64 /usr/local/bin/ttyd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 7681

ENTRYPOINT ["/entrypoint.sh"]
