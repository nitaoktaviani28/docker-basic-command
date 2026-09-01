#!/bin/bash
set -euo pipefail

config_value() {
  kubectl get configmap app-config-yaml -o jsonpath="{.data.$1}" 2>/dev/null
}

secret_value() {
  kubectl get secret app-secret-yaml -o jsonpath="{.data.$1}" 2>/dev/null | base64 -d
}

if ! kubectl get configmap app-config-yaml >/dev/null 2>&1 || ! kubectl get secret app-secret-yaml >/dev/null 2>&1; then
  echo "ConfigMap atau Secret YAML belum ditemukan."
  exit 1
fi

[ "$(config_value APP_NAME)" = "demo-yaml" ] && [ "$(config_value APP_ENV)" = "production" ] && [ "$(config_value APP_PORT)" = "8080" ] && [ "$(config_value LOG_LEVEL)" = "info" ] || {
  echo "Isi ConfigMap app-config-yaml belum sesuai."
  exit 1
}

[ "$(secret_value DB_USERNAME)" = "yamluser" ] && [ "$(secret_value DB_PASSWORD)" = "yamlpass123" ] && [ "$(secret_value API_KEY)" = "yaml-api-key-12345" ] || {
  echo "Isi Secret app-secret-yaml belum sesuai."
  exit 1
}

echo "Step 3 benar: ConfigMap dan Secret dari YAML sudah sesuai."
