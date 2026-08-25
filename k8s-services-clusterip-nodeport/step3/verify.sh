#!/bin/bash
set -euo pipefail

name="wordpress-client"

if ! kubectl get deployment "$name" >/dev/null 2>&1; then
  echo "Deployment $name belum ditemukan"
  exit 1
fi

image="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].image}')"
db_host="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="WORDPRESS_DB_HOST")].value}')"
db_user="$(kubectl get deployment "$name" -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="WORDPRESS_DB_USER")].value}')"
ready="$(kubectl get deployment "$name" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"

if [ "$image" != "wordpress:6.5-apache" ]; then
  echo "Image Deployment $name belum sesuai. Saat ini: $image"
  exit 1
fi

if [ "$db_host" != "mysql-service:3306" ]; then
  echo "WORDPRESS_DB_HOST belum sesuai. Saat ini: $db_host"
  exit 1
fi

if [ "$db_user" != "wpuser" ]; then
  echo "WORDPRESS_DB_USER belum sesuai. Saat ini: $db_user"
  exit 1
fi

if [ "${ready:-0}" -lt 1 ]; then
  echo "Deployment $name belum siap. Ready replica saat ini: ${ready:-0}"
  exit 1
fi

echo "Step 3 benar: Deployment WordPress berhasil dibuat dan terhubung ke Service MySQL."
