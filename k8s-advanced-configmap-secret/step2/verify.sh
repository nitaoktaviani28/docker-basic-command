#!/bin/bash
set -euo pipefail

config_value() {
  kubectl get configmap app-config-env -o jsonpath="{.data.$1}" 2>/dev/null
}

secret_value() {
  kubectl get secret app-secret-env -o jsonpath="{.data.$1}" 2>/dev/null | base64 -d
}

if ! kubectl get configmap app-config-env >/dev/null 2>&1 || ! kubectl get secret app-secret-env >/dev/null 2>&1; then
  echo "ConfigMap atau Secret dari file .env belum ditemukan."
  exit 1
fi

[ "$(config_value APP_NAME)" = "demo-env-file" ] && [ "$(config_value APP_ENV)" = "staging" ] && [ "$(config_value APP_PORT)" = "9090" ] && [ "$(config_value LOG_LEVEL)" = "debug" ] || {
  echo "Isi ConfigMap app-config-env belum sesuai."
  exit 1
}

[ "$(secret_value DB_USERNAME)" = "envuser" ] && [ "$(secret_value DB_PASSWORD)" = "envpass123" ] && [ "$(secret_value API_KEY)" = "env-api-key-12345" ] || {
  echo "Isi Secret app-secret-env belum sesuai."
  exit 1
}

echo "Step 2 benar: ConfigMap dan Secret dari file .env sudah sesuai."
