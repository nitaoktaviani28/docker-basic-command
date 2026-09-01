#!/bin/bash
set -euo pipefail

if ! kubectl get pod oom-demo -n quota-lab >/dev/null 2>&1; then
  echo "Pod oom-demo belum ditemukan."
  exit 1
fi

if kubectl get deployment nginx-scale-test -n quota-lab >/dev/null 2>&1; then
  echo "Deployment nginx-scale-test masih ada. Hapus terlebih dahulu agar quota cukup untuk demo OOM."
  exit 1
fi

reason="$(kubectl get pod oom-demo -n quota-lab -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}' 2>/dev/null || true)"

if [ "$reason" != "OOMKilled" ]; then
  echo "Container belum memiliki lastState OOMKilled. Saat ini: ${reason:-belum ada}"
  exit 1
fi

if [ ! -f /tmp/answer-oom-reason ] || ! grep -Fxq "OOMKilled" /tmp/answer-oom-reason; then
  echo "Reason OOMKilled belum tersimpan di /tmp/answer-oom-reason."
  exit 1
fi

echo "Step 5 benar: container dihentikan karena melebihi memory limit."
