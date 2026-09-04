#!/bin/bash
set -euo pipefail

for container in none-wordpress none-mysql; do
  if ! docker inspect "$container" >/dev/null 2>&1; then
    echo "Container $container belum ditemukan."
    exit 1
  fi

  network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' "$container")"
  if [ "$network_mode" != "none" ]; then
    echo "Container $container belum menggunakan --network none."
    exit 1
  fi
done

if [ ! -f /tmp/answer-none-interfaces ] || ! grep -q 'lo:' /tmp/answer-none-interfaces || grep -q 'eth0:' /tmp/answer-none-interfaces; then
  echo "none-wordpress seharusnya hanya memiliki interface loopback."
  exit 1
fi

if [ ! -f /tmp/answer-none-db-connection ] || ! grep -Fxq "blocked" /tmp/answer-none-db-connection; then
  echo "Belum ada bukti bahwa WordPress tidak dapat menghubungi MySQL pada none network."
  exit 1
fi

echo "Step 3 benar: WordPress tidak dapat berkomunikasi dengan MySQL pada none network."
