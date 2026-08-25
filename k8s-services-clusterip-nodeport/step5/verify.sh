#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-nodeport-http-code ]; then
  echo "File /tmp/answer-nodeport-http-code belum ada"
  exit 1
fi

service_name="wordpress-nodeport"

if ! kubectl get service "$service_name" >/dev/null 2>&1; then
  echo "Service $service_name belum ditemukan"
  exit 1
fi

answer="$(tr -d '[:space:]' < /tmp/answer-nodeport-http-code)"
actual="$(curl -I -s http://127.0.0.1:30080 | head -n 1 | awk '{print $2}' || true)"

if [ -z "$actual" ]; then
  node_ip="$(kubectl get node -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}' 2>/dev/null || true)"
  if [ -n "$node_ip" ]; then
    actual="$(curl -I -s "http://$node_ip:30080" | head -n 1 | awk '{print $2}' || true)"
  fi
fi

case "$actual" in
  200|301|302)
    ;;
  *)
    echo "Belum mendapatkan HTTP status valid dari NodePort. Status saat ini: ${actual:-kosong}"
    exit 1
    ;;
esac

if [ "$answer" != "$actual" ]; then
  echo "Jawaban HTTP status code salah. Expected: $actual, Dapat: $answer"
  exit 1
fi

echo "Step 5 benar: WordPress berhasil diakses melalui Service NodePort."
