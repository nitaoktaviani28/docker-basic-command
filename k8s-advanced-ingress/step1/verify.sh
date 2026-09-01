#!/bin/bash
set -euo pipefail

if ! kubectl get namespace ingress-lab >/dev/null 2>&1; then
  echo "Namespace ingress-lab belum ditemukan."
  exit 1
fi

phase="$(kubectl get namespace ingress-lab -o jsonpath='{.status.phase}')"
ready="$(kubectl get deployment ingress-nginx-controller -n ingress-nginx -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
service_type="$(kubectl get service ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.type}' 2>/dev/null || true)"

if [ "$phase" != "Active" ]; then
  echo "Namespace ingress-lab belum Active."
  exit 1
fi

if [ "${ready:-0}" -lt 1 ]; then
  echo "Ingress controller belum siap. Ready replica: ${ready:-0}"
  exit 1
fi

if [ "$service_type" != "NodePort" ]; then
  echo "Service ingress-nginx-controller belum bertipe NodePort. Saat ini: ${service_type:-belum ada}"
  exit 1
fi

if ! kubectl get ingressclass nginx >/dev/null 2>&1; then
  echo "IngressClass nginx belum ditemukan."
  exit 1
fi

echo "Step 1 benar: ingress-nginx dan Namespace ingress-lab sudah siap."
