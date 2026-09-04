#!/bin/bash
set -euo pipefail

if ! docker volume ls --format '{{.Name}}' | grep -q 'mysql_data'; then
  echo "Named volume MySQL tidak ditemukan."
  exit 1
fi

if [ ! -f /tmp/answer-persistence ] || ! grep -q '<li>Nita</li>' /tmp/answer-persistence; then
  echo "Data Nita belum terbukti tetap ada setelah Docker Compose dijalankan ulang."
  exit 1
fi

echo "Step 5 benar: data MySQL tetap ada karena named volume."
