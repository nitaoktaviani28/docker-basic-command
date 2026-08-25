#!/bin/bash
set -euo pipefail

name="nginx-yaml"

if [ ! -f /tmp/deleted-pod-name ]; then
  echo "File /tmp/deleted-pod-name belum ada. Simpan nama Pod yang dihapus sebelum klik Check."
  exit 1
fi

deleted_pod="$(sed -e 's/[[:space:]]*$//' /tmp/deleted-pod-name)"

if [ -z "$deleted_pod" ]; then
  echo "Isi /tmp/deleted-pod-name kosong"
  exit 1
fi

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

if kubectl get pod "$deleted_pod" >/dev/null 2>&1; then
  echo "Pod yang dihapus masih ada dengan nama yang sama. Pastikan kamu benar-benar menghapus salah satu Pod."
  exit 1
fi

replicas="$(kubectl get deployment "$name" -o jsonpath='{.spec.replicas}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
current_pods="$(kubectl get pods -l app=nginx-yaml --no-headers 2>/dev/null | wc -l | tr -d '[:space:]')"

if [ "$replicas" != "4" ]; then
  echo "Replica Deployment $name tidak berada di 4. Saat ini: $replicas"
  exit 1
fi

if [ "${ready:-0}" -lt 4 ]; then
  echo "Ready replica Deployment $name belum 4. Saat ini: ${ready:-0}"
  exit 1
fi

if [ "$current_pods" != "4" ]; then
  echo "Jumlah Pod untuk Deployment $name belum kembali ke 4. Saat ini: $current_pods"
  exit 1
fi

echo "Step 5 benar: Deployment melakukan self-healing dan jumlah Pod kembali sesuai replica."
