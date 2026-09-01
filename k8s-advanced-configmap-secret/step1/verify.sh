#!/bin/bash
set -euo pipefail

config_value() {
  kubectl get configmap app-config-command -o jsonpath="{.data.$1}" 2>/dev/null
}

secret_value() {
  kubectl get secret app-secret-command -o jsonpath="{.data.$1}" 2>/dev/null | base64 -d
}

if ! kubectl get configmap app-config-command >/dev/null 2>&1; then
  echo "ConfigMap app-config-command belum ditemukan."
  exit 1
fi

if ! kubectl get secret app-secret-command >/dev/null 2>&1; then
  echo "Secret app-secret-command belum ditemukan."
  exit 1
fi

[ "$(config_value APP_NAME)" = "demo-command" ] && [ "$(config_value APP_ENV)" = "development" ] && [ "$(config_value APP_PORT)" = "8080" ] || {
  echo "Isi ConfigMap app-config-command belum sesuai."
  exit 1
}

[ "$(secret_value DB_USERNAME)" = "admin" ] && [ "$(secret_value DB_PASSWORD)" = "secret123" ] || {
  echo "Isi Secret app-secret-command belum sesuai."
  exit 1
}

echo "Step 1 benar: ConfigMap dan Secret dari command sudah sesuai."
