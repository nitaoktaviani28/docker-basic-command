#!/bin/bash
set -euo pipefail

for container in host-wordpress host-mysql; do
  if ! docker inspect "$container" >/dev/null 2>&1; then
    echo "Container $container belum ditemukan."
    exit 1
  fi

  network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' "$container")"
  if [ "$network_mode" != "host" ]; then
    echo "Container $container belum menggunakan --network host."
    exit 1
  fi
done

if [ ! -f /tmp/answer-host-wordpress-access ] || ! grep -q "WordPress" /tmp/answer-host-wordpress-access; then
  echo "WordPress belum dapat diakses melalui IP host."
  exit 1
fi

if [ ! -f /tmp/answer-host-db-connection ] || ! grep -Fxq "connected" /tmp/answer-host-db-connection; then
  echo "Koneksi WordPress ke MySQL pada host network belum berhasil."
  exit 1
fi

echo "Step 2 benar: WordPress dan MySQL berjalan langsung pada network host."
