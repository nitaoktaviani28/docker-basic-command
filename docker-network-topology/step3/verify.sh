#!/bin/bash
set -euo pipefail

if ! docker inspect host-web >/dev/null 2>&1; then
  echo "Container host-web belum ditemukan."
  exit 1
fi

network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' host-web)"
running="$(docker inspect -f '{{.State.Running}}' host-web)"

if [ "$network_mode" != "host" ] || [ "$running" != "true" ]; then
  echo "host-web belum berjalan dengan --network host."
  exit 1
fi

if [ ! -f /tmp/answer-host-network-access ] || ! grep -q 'Welcome to nginx!' /tmp/answer-host-network-access; then
  echo "Akses ke Nginx melalui IP host belum berhasil."
  exit 1
fi

echo "Step 3 benar: host-web memakai network host tanpa port mapping."
