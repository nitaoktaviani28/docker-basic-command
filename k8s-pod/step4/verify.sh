#!/bin/bash
set -euo pipefail

manifest="manifests/nginx-pod.yaml"
pod="nginx-yaml"

if [ ! -f "$manifest" ]; then
  echo "File $manifest belum dibuat"
  exit 1
fi

if ! kubectl get pod "$pod" >/dev/null 2>&1; then
  echo "Pod $pod belum ditemukan"
  exit 1
fi

phase="$(kubectl get pod "$pod" -o jsonpath='{.status.phase}')"
container_name="$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].name}')"
container_image="$(kubectl get pod "$pod" -o jsonpath='{.spec.containers[0].image}')"
label_app="$(kubectl get pod "$pod" -o jsonpath='{.metadata.labels.app}')"

if [ "$phase" != "Running" ]; then
  echo "Pod $pod belum Running. Status saat ini: $phase"
  exit 1
fi

if [ "$container_name" != "nginx-container" ]; then
  echo "Nama container pada $pod belum sesuai. Saat ini: $container_name"
  exit 1
fi

if [ "$container_image" != "nginx:latest" ]; then
  echo "Image pada $pod belum sesuai. Saat ini: $container_image"
  exit 1
fi

if [ "$label_app" != "nginx-yaml" ]; then
  echo "Label app pada $pod belum sesuai. Saat ini: $label_app"
  exit 1
fi

echo "Step 4 benar: Pod $pod berhasil dibuat dari YAML dan statusnya Running."
