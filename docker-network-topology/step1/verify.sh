#!/bin/bash
set -euo pipefail

if ! docker network inspect webinar-bridge >/dev/null 2>&1; then
  echo "Network webinar-bridge belum ditemukan."
  exit 1
fi

if ! docker inspect bridge-web >/dev/null 2>&1; then
  echo "Container bridge-web belum ditemukan."
  exit 1
fi

network_mode="$(docker inspect -f '{{.HostConfig.NetworkMode}}' bridge-web)"
host_port="$(docker inspect -f '{{(index (index .NetworkSettings.Ports "80/tcp") 0).HostPort}}' bridge-web 2>/dev/null || true)"
running="$(docker inspect -f '{{.State.Running}}' bridge-web)"

if [ "$network_mode" != "webinar-bridge" ] || [ "$host_port" != "8080" ] || [ "$running" != "true" ]; then
  echo "bridge-web belum berjalan pada webinar-bridge dengan mapping 8080:80."
  exit 1
fi

if [ ! -f /tmp/answer-bridge-host-access ] || ! grep -q 'Welcome to nginx!' /tmp/answer-bridge-host-access; then
  echo "Hasil akses bridge dari host belum tersimpan atau belum berhasil."
  exit 1
fi

echo "Step 1 benar: bridge-web dapat diakses dari host melalui port 8080."
