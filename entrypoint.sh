#!/bin/bash
set -e

# Start Tailscale daemon in background
tailscaled &

# Wait a bit for the daemon to be ready
sleep 5

# Login to Tailscale using your auth key (replace with secret env var in production)
tailscale up --authkey=tskey-auth-kuhrouL5b511CNTRL-7H2iAEgaizWu6QoWcUc31Xpy9hWJKhgQA --hostname=koyeb-vps

# Start lightweight HTTP server for health checks
python3 /healthcheck.py &

# Keep container alive
tail -f /dev/null
