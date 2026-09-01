#!/bin/bash
set -euo pipefail

namespace="ingress-lab"

if ! kubectl get deployment web-blue -n "$namespace" >/dev/null 2>&1 || ! kubectl get service svc-web-blue -n "$namespace" >/dev/null 2>&1; then
  echo "Deployment atau Service Blue belum ditemukan."
  exit 1
fi

ready="$(kubectl get deployment web-blue -n "$namespace" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment web-blue -n "$namespace" -o jsonpath='{.spec.template.spec.containers[0].image}')"
service_type="$(kubectl get service svc-web-blue -n "$namespace" -o jsonpath='{.spec.type}')"
port="$(kubectl get service svc-web-blue -n "$namespace" -o jsonpath='{.spec.ports[0].port}')"
target_port="$(kubectl get service svc-web-blue -n "$namespace" -o jsonpath='{.spec.ports[0].targetPort}')"
endpoint_count="$(kubectl get endpoints svc-web-blue -n "$namespace" -o jsonpath='{.subsets[*].addresses[*].ip}' | awk '{print NF}')"

if [ "${ready:-0}" -lt 1 ] || [ "$image" != "hashicorp/http-echo" ]; then
  echo "Deployment web-blue belum siap atau image belum sesuai."
  exit 1
fi

if [ "$service_type" != "ClusterIP" ] || [ "$port" != "80" ] || [ "$target_port" != "5678" ] || [ "${endpoint_count:-0}" -lt 1 ]; then
  echo "Service svc-web-blue belum sesuai atau belum memiliki endpoint."
  exit 1
fi

echo "Step 2 benar: Backend Blue dan Service ClusterIP sudah siap."
