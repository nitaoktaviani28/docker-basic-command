#!/bin/bash
set -euo pipefail

replicas="$(kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.replicas}' 2>/dev/null || true)"
ready="$(kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"

if [ "$replicas" != "4" ] || [ "${ready:-0}" -lt 4 ]; then
  echo "Deployment nginx-rollout belum memiliki 4 replica Ready. Spec: ${replicas:-0}, Ready: ${ready:-0}"
  exit 1
fi

echo "Step 2 benar: Deployment berhasil di-scale menjadi 4 replica."
