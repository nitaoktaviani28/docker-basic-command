#!/bin/bash
set -euo pipefail

if ! kubectl get namespace quota-lab >/dev/null 2>&1 || ! kubectl get resourcequota quota-lab-limit -n quota-lab >/dev/null 2>&1; then
  echo "Namespace quota-lab atau ResourceQuota quota-lab-limit belum ditemukan."
  exit 1
fi

value() { kubectl get resourcequota quota-lab-limit -n quota-lab -o jsonpath="{.spec.hard.$1}"; }

[ "$(value pods)" = "5" ] && [ "$(value requests\\.cpu)" = "500m" ] && [ "$(value requests\\.memory)" = "512Mi" ] && [ "$(value limits\\.cpu)" = "1" ] && [ "$(value limits\\.memory)" = "1Gi" ] || {
  echo "Nilai hard pada ResourceQuota belum sesuai."
  exit 1
}

echo "Step 1 benar: ResourceQuota quota-lab-limit sudah diterapkan."
