#!/bin/bash
set -euo pipefail

replicas="$(kubectl get deployment nginx-scale-test -n quota-lab -o jsonpath='{.spec.replicas}' 2>/dev/null || true)"
ready="$(kubectl get deployment nginx-scale-test -n quota-lab -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"

if [ "$replicas" != "3" ] || [ "${ready:-0}" -ge 3 ]; then
  echo "Scale test belum menunjukkan replica yang tertahan quota. Target replica: ${replicas:-0}, Ready: ${ready:-0}"
  exit 1
fi

if [ ! -f /tmp/answer-quota-error ] || ! grep -Eqi "quota|exceeded" /tmp/answer-quota-error; then
  echo "Bukti error quota belum tersimpan di /tmp/answer-quota-error."
  exit 1
fi

echo "Step 4 benar: replica ketiga ditolak karena ResourceQuota."
