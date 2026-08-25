#!/bin/bash
set -euo pipefail

name="wordpress-nodeport"

if ! kubectl get service "$name" >/dev/null 2>&1; then
  echo "Service $name belum ditemukan"
  exit 1
fi

svc_type="$(kubectl get service "$name" -o jsonpath='{.spec.type}')"
port="$(kubectl get service "$name" -o jsonpath='{.spec.ports[0].port}')"
target_port="$(kubectl get service "$name" -o jsonpath='{.spec.ports[0].targetPort}')"
node_port="$(kubectl get service "$name" -o jsonpath='{.spec.ports[0].nodePort}')"
selector="$(kubectl get service "$name" -o jsonpath='{.spec.selector.app}')"

if [ "$svc_type" != "NodePort" ]; then
  echo "Tipe Service $name belum NodePort. Saat ini: $svc_type"
  exit 1
fi

if [ "$port" != "80" ] || [ "$target_port" != "80" ]; then
  echo "Port Service $name belum sesuai. Saat ini port=$port targetPort=$target_port"
  exit 1
fi

if [ "$node_port" != "30080" ]; then
  echo "NodePort Service $name belum sesuai. Saat ini: $node_port"
  exit 1
fi

if [ "$selector" != "wordpress-client" ]; then
  echo "Selector Service $name belum sesuai. Saat ini: $selector"
  exit 1
fi

echo "Step 4 benar: Service NodePort WordPress sudah aktif pada port 30080."
