#!/bin/bash
set -euo pipefail

manifest="manifests/nginx-deployment.yaml"
name="nginx-yaml"

if [ ! -f "$manifest" ]; then
  echo "File $manifest belum dibuat"
  exit 1
fi

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

replicas="$(kubectl get deployment "$name" -o jsonpath='{.spec.replicas}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].image}')"
container_name="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].name}')"

if [ "$replicas" != "2" ]; then
  echo "Replica Deployment $name belum sesuai. Saat ini: $replicas"
  exit 1
fi

if [ "${ready:-0}" -lt 2 ]; then
  echo "Ready replica Deployment $name belum 2. Saat ini: ${ready:-0}"
  exit 1
fi

if [ "$image" != "nginx:1.25" ]; then
  echo "Image Deployment $name belum sesuai. Saat ini: $image"
  exit 1
fi

if [ "$container_name" != "nginx-container" ]; then
  echo "Nama container Deployment $name belum sesuai. Saat ini: $container_name"
  exit 1
fi

echo "Step 2 benar: Deployment $name berhasil dibuat dari YAML dengan 2 replica."
