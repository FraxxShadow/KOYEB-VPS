FROM debian:bullseye-slim

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    python3 \
    python3-pip \
    curl \
    gnupg \
    iproute2 \
    iptables \
    ca-certificates \
    openssh-client \
    sudo \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Tailscale
RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | gpg --dearmor -o /usr/share/keyrings/tailscale-archive-keyring.gpg && \
    curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list \
    | tee /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && \
    apt-get install -y tailscale && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy scripts
COPY entrypoint.sh /entrypoint.sh
COPY healthcheck.py /healthcheck.py
RUN chmod +x /entrypoint.sh

# Expose health check port
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
