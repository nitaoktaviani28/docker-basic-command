#!/bin/bash
set -euo pipefail

pods_used="$(kubectl get resourcequota quota-lab-limit -n quota-lab -o jsonpath='{.status.used.pods}' 2>/dev/null || true)"

if [ "${pods_used:-0}" -lt 2 ]; then
  echo "Pemakaian quota belum mencatat 2 Pod. Used pods: ${pods_used:-0}"
  exit 1
fi

if [ ! -f /tmp/answer-resourcequota-used ] || ! grep -q "quota-lab-limit" /tmp/answer-resourcequota-used; then
  echo "Hasil describe quota belum disimpan di /tmp/answer-resourcequota-used."
  exit 1
fi

echo "Step 3 benar: pemakaian ResourceQuota sudah diperiksa dan disimpan."
