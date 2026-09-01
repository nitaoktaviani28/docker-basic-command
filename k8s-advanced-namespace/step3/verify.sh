#!/bin/bash
set -euo pipefail

check_deployment() {
  local namespace="$1"
  local expected_image="$2"
  local image
  local ready

  if ! kubectl get deployment nginx-app -n "$namespace" >/dev/null 2>&1; then
    echo "Deployment nginx-app belum ditemukan di Namespace $namespace."
    exit 1
  fi

  image="$(kubectl get deployment nginx-app -n "$namespace" -o jsonpath='{.spec.template.spec.containers[0].image}')"
  ready="$(kubectl get deployment nginx-app -n "$namespace" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"

  if [ "$image" != "$expected_image" ]; then
    echo "Image nginx-app di $namespace belum sesuai. Saat ini: $image"
    exit 1
  fi

  if [ "${ready:-0}" -lt 1 ]; then
    echo "Deployment nginx-app di $namespace belum siap. Ready replica: ${ready:-0}"
    exit 1
  fi
}

check_deployment dev nginx:1.25
check_deployment prod nginx:1.26

echo "Step 3 benar: nginx-app berhasil dibuat di Namespace dev dan prod."
