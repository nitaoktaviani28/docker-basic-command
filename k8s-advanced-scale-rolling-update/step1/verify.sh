#!/bin/bash
set -euo pipefail

namespace="rollout-lab"
name="nginx-rollout"

if ! kubectl get namespace "$namespace" >/dev/null 2>&1 || ! kubectl get deployment "$name" -n "$namespace" >/dev/null 2>&1; then
  echo "Namespace rollout-lab atau Deployment nginx-rollout belum ditemukan."
  exit 1
fi

replicas="$(kubectl get deployment "$name" -n "$namespace" -o jsonpath='{.spec.replicas}')"
ready="$(kubectl get deployment "$name" -n "$namespace" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment "$name" -n "$namespace" -o jsonpath='{.spec.template.spec.containers[0].image}')"
strategy="$(kubectl get deployment "$name" -n "$namespace" -o jsonpath='{.spec.strategy.type}')"

if [ "$replicas" != "2" ] || [ "${ready:-0}" -lt 2 ] || [ "$image" != "nginx:1.25" ] || [ "$strategy" != "RollingUpdate" ]; then
  echo "Deployment awal belum sesuai. Target: 2 replica Ready, nginx:1.25, strategi RollingUpdate."
  exit 1
fi

echo "Step 1 benar: Deployment awal dengan 2 replica sudah siap."
