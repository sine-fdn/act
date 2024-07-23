FROM debian:bookworm-slim

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
