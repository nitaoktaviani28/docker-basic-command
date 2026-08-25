#!/bin/bash
set -euo pipefail

name="nginx-yaml"

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

image="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].image}')"
replicas="$(kubectl get deployment "$name" -o jsonpath='{.spec.replicas}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
strategy="$(kubectl get deployment "$name" -o jsonpath='{.spec.strategy.type}')"

if [ "$image" != "nginx:1.26" ]; then
  echo "Image Deployment $name belum berubah ke nginx:1.26. Saat ini: $image"
  exit 1
fi

if [ "$replicas" != "4" ]; then
  echo "Replica Deployment $name tidak berada di 4. Saat ini: $replicas"
  exit 1
fi

if [ "${ready:-0}" -lt 4 ]; then
  echo "Ready replica Deployment $name belum 4. Saat ini: ${ready:-0}"
  exit 1
fi

if [ "$strategy" != "RollingUpdate" ]; then
  echo "Strategy Deployment $name bukan RollingUpdate. Saat ini: $strategy"
  exit 1
fi

echo "Step 4 benar: image berhasil diupdate dan rolling update berjalan sesuai harapan."
