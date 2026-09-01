#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-ingress-blue ] || ! grep -Fxq "Hello from Blue App via Ingress" /tmp/answer-ingress-blue; then
  echo "Response Blue belum benar atau belum tersimpan di /tmp/answer-ingress-blue."
  exit 1
fi

if [ ! -f /tmp/answer-ingress-green ] || ! grep -Fxq "Hello from Green App via Ingress" /tmp/answer-ingress-green; then
  echo "Response Green belum benar atau belum tersimpan di /tmp/answer-ingress-green."
  exit 1
fi

echo "Step 5 benar: route /blue dan /green berhasil melewati Ingress."
