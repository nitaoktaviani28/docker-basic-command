#!/bin/bash
set -euo pipefail

name="nginx-command"

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].image}')"

if [ "$image" != "nginx:1.25" ]; then
  echo "Image Deployment $name belum sesuai. Saat ini: $image"
  exit 1
fi

if [ "${ready:-0}" -lt 1 ]; then
  echo "Deployment $name belum siap. Ready replica saat ini: ${ready:-0}"
  exit 1
fi

echo "Step 1 benar: Deployment $name berhasil dibuat dan sudah tersedia."
