#!/bin/bash
set -euo pipefail

if ! kubectl get deployment nginx-env-demo >/dev/null 2>&1; then
  echo "Deployment nginx-env-demo belum ditemukan."
  exit 1
fi

ready="$(kubectl get deployment nginx-env-demo -o jsonpath='{.status.readyReplicas}' 2>/dev/null || true)"
image="$(kubectl get deployment nginx-env-demo -o jsonpath='{.spec.template.spec.containers[0].image}')"
config_ref="$(kubectl get deployment nginx-env-demo -o jsonpath='{.spec.template.spec.containers[0].envFrom[0].configMapRef.name}')"
secret_ref="$(kubectl get deployment nginx-env-demo -o jsonpath='{.spec.template.spec.containers[0].envFrom[1].secretRef.name}')"

if [ "${ready:-0}" -lt 1 ] || [ "$image" != "nginx:1.25" ]; then
  echo "Deployment nginx-env-demo belum siap atau image belum sesuai."
  exit 1
fi

if [ "$config_ref" != "app-config-yaml" ] || [ "$secret_ref" != "app-secret-yaml" ]; then
  echo "Referensi envFrom pada Deployment belum sesuai."
  exit 1
fi

if [ ! -f /tmp/answer-env-result ]; then
  echo "Hasil environment variable belum disimpan di /tmp/answer-env-result."
  exit 1
fi

for expected in APP_NAME=demo-yaml APP_ENV=production APP_PORT=8080 LOG_LEVEL=info DB_USERNAME=yamluser DB_PASSWORD=yamlpass123 API_KEY=yaml-api-key-12345; do
  if ! grep -Fxq "$expected" /tmp/answer-env-result; then
    echo "Value $expected belum ditemukan di /tmp/answer-env-result."
    exit 1
  fi
done

echo "Step 4 benar: ConfigMap dan Secret berhasil masuk ke environment container."
