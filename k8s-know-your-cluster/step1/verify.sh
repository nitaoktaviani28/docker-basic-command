#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-node-count ]; then
  echo "File /tmp/answer-node-count belum ada"
  exit 1
fi

answer="$(tr -d '[:space:]' < /tmp/answer-node-count)"
expected="2"
actual_total="$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d '[:space:]')"
actual_cp="$(kubectl get nodes --no-headers 2>/dev/null | awk '$3 ~ /control-plane|master/ {c++} END{print c+0}')"

if [ "$answer" != "$expected" ]; then
  echo "Jawaban jumlah node salah. Expected: $expected, Dapat: $answer"
  exit 1
fi

if [ "$actual_total" != "2" ]; then
  echo "Cluster belum sesuai target. Saat ini node terdeteksi: $actual_total, seharusnya 2 (1 control-plane + 1 worker)."
  exit 1
fi

if [ "$actual_cp" != "1" ]; then
  echo "Cluster belum sesuai target. Control-plane terdeteksi: $actual_cp, seharusnya 1."
  exit 1
fi

echo "Step 1 benar: 2 node terdeteksi (1 control-plane + 1 worker)."
