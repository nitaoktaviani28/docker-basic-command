#!/bin/bash
set -euo pipefail

name="mysql-service"

if ! kubectl get service "$name" >/dev/null 2>&1; then
  echo "Service $name belum ditemukan"
  exit 1
fi

svc_type="$(kubectl get service "$name" -o jsonpath='{.spec.type}')"
port="$(kubectl get service "$name" -o jsonpath='{.spec.ports[0].port}')"
target_port="$(kubectl get service "$name" -o jsonpath='{.spec.ports[0].targetPort}')"
selector="$(kubectl get service "$name" -o jsonpath='{.spec.selector.app}')"
endpoint_count="$(kubectl get endpoints "$name" -o jsonpath='{.subsets[*].addresses[*].ip}' | awk '{print NF}')"

if [ "$svc_type" != "ClusterIP" ]; then
  echo "Tipe Service $name belum ClusterIP. Saat ini: $svc_type"
  exit 1
fi

if [ "$port" != "3306" ] || [ "$target_port" != "3306" ]; then
  echo "Port Service $name belum sesuai. Saat ini port=$port targetPort=$target_port"
  exit 1
fi

if [ "$selector" != "mysql-backend" ]; then
  echo "Selector Service $name belum sesuai. Saat ini: $selector"
  exit 1
fi

if [ "${endpoint_count:-0}" -lt 1 ]; then
  echo "Endpoint Service $name belum tersedia"
  exit 1
fi

echo "Step 2 benar: Service ClusterIP untuk MySQL sudah aktif dan memiliki endpoint."
