#!/bin/bash
set -euo pipefail

name="nginx-yaml"

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

replicas="$(kubectl get deployment "$name" -o jsonpath='{.spec.replicas}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
available="$(kubectl get deployment "$name" -o jsonpath='{.status.availableReplicas}' 2>/dev/null || true)"

if [ "$replicas" != "4" ]; then
  echo "Deployment $name belum berada di 4 replica. Saat ini: $replicas"
  exit 1
fi

if [ "${ready:-0}" -lt 4 ]; then
  echo "Ready replica Deployment $name belum 4. Saat ini: ${ready:-0}"
  exit 1
fi

if [ "${available:-0}" -lt 4 ]; then
  echo "Available replica Deployment $name belum 4. Saat ini: ${available:-0}"
  exit 1
fi

echo "Step 3 benar: Deployment $name berhasil di-scale dan saat ini memiliki 4 replica siap pakai."
