#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-node-count ]; then
  echo "File /tmp/answer-node-count belum ada"
  exit 1
fi

answer="$(tr -d '[:space:]' < /tmp/answer-node-count)"
expected="$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d '[:space:]')"

if [ "$answer" != "$expected" ]; then
  echo "Jawaban jumlah node salah. Expected: $expected, Dapat: $answer"
  exit 1
fi

echo "Step 1 benar"
