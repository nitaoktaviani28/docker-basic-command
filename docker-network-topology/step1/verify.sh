#!/bin/bash
set -euo pipefail

for container in bridge-wordpress bridge-mysql; do
  if ! docker inspect "$container" >/dev/null 2>&1; then
    echo "Container $container belum ditemukan."
    exit 1
  fi

  network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' "$container")"
  if [ "$network_mode" != "wordpress-bridge" ]; then
    echo "Container $container belum menggunakan network wordpress-bridge."
    exit 1
  fi
done

host_port="$(docker inspect -f '{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' bridge-wordpress 2>/dev/null || true)"
if [ "$host_port" != "8080" ]; then
  echo "bridge-wordpress belum memiliki port mapping 8080:80."
  exit 1
fi

if [ ! -f /tmp/answer-bridge-db-connection ] || ! grep -Fxq "connected" /tmp/answer-bridge-db-connection; then
  echo "Koneksi WordPress ke MySQL pada bridge belum berhasil."
  exit 1
fi

if [ ! -f /tmp/answer-bridge-wordpress-access ] || ! grep -q "WordPress" /tmp/answer-bridge-wordpress-access; then
  echo "Halaman WordPress belum berhasil diakses melalui port 8080."
  exit 1
fi

echo "Step 1 benar: WordPress dan MySQL berkomunikasi pada bridge network."
