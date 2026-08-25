#!/bin/bash
set -euo pipefail

name="mysql-backend"

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

image="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].image}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
db_name="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="MYSQL_DATABASE")].value}')"

if [ "$image" != "mysql:8.0" ]; then
  echo "Image Deployment $name belum sesuai. Saat ini: $image"
  exit 1
fi

if [ "${ready:-0}" -lt 1 ]; then
  echo "Deployment $name belum siap. Ready replica saat ini: ${ready:-0}"
  exit 1
fi

if [ "$db_name" != "wordpress" ]; then
  echo "Environment MYSQL_DATABASE belum sesuai. Saat ini: $db_name"
  exit 1
fi

echo "Step 1 benar: Deployment MySQL backend berhasil dibuat dan berjalan."
