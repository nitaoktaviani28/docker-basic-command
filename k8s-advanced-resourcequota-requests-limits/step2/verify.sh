#!/bin/bash
set -euo pipefail

if ! kubectl get deployment nginx-limited -n quota-lab >/dev/null 2>&1; then
  echo "Deployment nginx-limited belum ditemukan."
  exit 1
fi

ready="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
replicas="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.spec.replicas}')"
cpu_request="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.spec.template.spec.containers[0].resources.requests.cpu}')"
memory_request="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.spec.template.spec.containers[0].resources.requests.memory}')"
cpu_limit="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.spec.template.spec.containers[0].resources.limits.cpu}')"
memory_limit="$(kubectl get deployment nginx-limited -n quota-lab -o jsonpath='{.spec.template.spec.containers[0].resources.limits.memory}')"

if [ "$replicas" != "2" ] || [ "${ready:-0}" -lt 2 ] || [ "$cpu_request" != "100m" ] || [ "$memory_request" != "64Mi" ] || [ "$cpu_limit" != "200m" ] || [ "$memory_limit" != "128Mi" ]; then
  echo "Deployment nginx-limited belum memiliki 2 replica Ready dengan requests dan limits yang benar."
  exit 1
fi

echo "Step 2 benar: nginx-limited berjalan dengan requests dan limits yang sesuai."
