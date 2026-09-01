#!/bin/bash
set -euo pipefail

replicas="$(kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.replicas}' 2>/dev/null || true)"
ready="$(kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.template.spec.containers[0].image}' 2>/dev/null || true)"

if [ "$replicas" != "4" ] || [ "${ready:-0}" -lt 4 ] || [ "$image" != "nginx:1.25" ]; then
  echo "Rollback belum sesuai. Target: 4 replica Ready dengan image nginx:1.25."
  exit 1
fi

echo "Step 4 benar: rollback ke nginx:1.25 berhasil dan 4 replica tetap tersedia."
