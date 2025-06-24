#!/bin/bash
set -e

# Start Tailscale daemon
tailscaled &

# Wait for tailscaled to be ready
sleep 5

# Login to Tailscale using your auth key (replace with secret env var in production)
tailscale up --authkey=tskey-auth-kuhrouL5b511CNTRL-7H2iAEgaizWu6QoWcUc31Xpy9hWJKhgQA --hostname=koyeb-vps

# Keep container running
tail -f /dev/null
