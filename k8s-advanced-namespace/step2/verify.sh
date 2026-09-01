#!/bin/bash
set -euo pipefail

if ! kubectl get deployment nginx-app -n default >/dev/null 2>&1; then
  echo "Deployment nginx-app belum ditemukan di Namespace default."
  exit 1
fi

image="$(kubectl get deployment nginx-app -n default -o jsonpath='{.spec.template.spec.containers[0].image}')"
ready="$(kubectl get deployment nginx-app -n default -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"

if [ "$image" != "nginx:1.25" ]; then
  echo "Image Deployment nginx-app di default belum sesuai. Saat ini: $image"
  exit 1
fi

if [ "${ready:-0}" -lt 1 ]; then
  echo "Deployment nginx-app di default belum siap. Ready replica: ${ready:-0}"
  exit 1
fi

if [ ! -f /tmp/answer-same-namespace-error ] || ! grep -q "AlreadyExists" /tmp/answer-same-namespace-error; then
  echo "Bukti error AlreadyExists belum tersimpan di /tmp/answer-same-namespace-error."
  exit 1
fi

echo "Step 2 benar: nama Deployment harus unik di Namespace yang sama."
