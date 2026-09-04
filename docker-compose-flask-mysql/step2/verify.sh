#!/bin/bash
set -euo pipefail

for container in simple-python-app simple-mysql; do
  running="$(docker inspect -f '{{.State.Running}}' "$container" 2>/dev/null || true)"
  if [ "$running" != "true" ]; then
    echo "Container $container belum berjalan."
    exit 1
  fi
done

if [ ! -f /tmp/answer-compose-health ] || ! grep -Fxq "Application is healthy" /tmp/answer-compose-health; then
  echo "Health check aplikasi belum berhasil atau belum disimpan."
  exit 1
fi

echo "Step 2 benar: Flask dan MySQL berhasil dijalankan oleh Docker Compose."
