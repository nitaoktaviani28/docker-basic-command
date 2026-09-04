#!/bin/bash
set -euo pipefail

if ! docker inspect none-isolated >/dev/null 2>&1; then
  echo "Container none-isolated belum ditemukan."
  exit 1
fi

network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' none-isolated)"

if [ "$network_mode" != "none" ]; then
  echo "none-isolated belum berjalan dengan --network none."
  exit 1
fi

if [ ! -f /tmp/answer-none-interfaces ] || ! grep -q 'lo:' /tmp/answer-none-interfaces || grep -q 'eth0:' /tmp/answer-none-interfaces; then
  echo "Interface none network belum sesuai. Container seharusnya hanya memiliki loopback."
  exit 1
fi

if [ ! -f /tmp/answer-none-connectivity ] || ! grep -Fxq 'blocked' /tmp/answer-none-connectivity; then
  echo "Bukti bahwa none-isolated tidak dapat mengakses network belum tersedia."
  exit 1
fi

echo "Step 4 benar: none-isolated terisolasi dan hanya memiliki interface loopback."
