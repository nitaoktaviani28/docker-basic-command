#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-app-name ] || ! grep -q '<li>Nita</li>' /tmp/answer-app-name; then
  echo "Nama Nita belum muncul pada respons aplikasi."
  exit 1
fi

if [ ! -f /tmp/answer-mysql-name ] || ! grep -Fxq "Nita" /tmp/answer-mysql-name; then
  echo "Nama Nita belum ditemukan pada query MySQL."
  exit 1
fi

echo "Step 3 benar: aplikasi Flask berhasil menyimpan Nita ke MySQL."
