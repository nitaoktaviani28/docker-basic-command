#!/bin/bash
set -euo pipefail

for answer in /tmp/answer-bridge-container-dns /tmp/answer-bridge-container-ip; do
  if [ ! -f "$answer" ] || ! grep -q 'Welcome to nginx!' "$answer"; then
    echo "Komunikasi antar-container Bridge belum terbukti. Periksa $answer."
    exit 1
  fi
done

echo "Step 2 benar: container pada webinar-bridge dapat berkomunikasi lewat DNS dan IP internal."
