#!/bin/bash
set -euo pipefail

network_name="$(docker inspect -f '{{range $name, $_ := .NetworkSettings.Networks}}{{$name}}{{end}}' simple-python-app 2>/dev/null || true)"
volume_destination="$(docker inspect -f '{{range .Mounts}}{{.Destination}}{{end}}' simple-mysql 2>/dev/null || true)"

if [[ "$network_name" != *"app-network"* ]]; then
  echo "simple-python-app belum berada pada Compose app-network."
  exit 1
fi

if [[ "$volume_destination" != *"/var/lib/mysql"* ]]; then
  echo "MySQL belum memakai named volume pada /var/lib/mysql."
  exit 1
fi

if [ ! -f /tmp/answer-compose-network ] || ! grep -q "simple-python-app" /tmp/answer-compose-network || ! grep -q "simple-mysql" /tmp/answer-compose-network; then
  echo "Hasil pemeriksaan network belum lengkap."
  exit 1
fi

echo "Step 4 benar: app dan MySQL berada pada bridge network serta MySQL memakai volume."
