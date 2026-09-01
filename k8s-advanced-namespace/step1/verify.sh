#!/bin/bash
set -euo pipefail

for namespace in dev prod; do
  if ! kubectl get namespace "$namespace" >/dev/null 2>&1; then
    echo "Namespace $namespace belum ditemukan."
    exit 1
  fi

  phase="$(kubectl get namespace "$namespace" -o jsonpath='{.status.phase}')"
  if [ "$phase" != "Active" ]; then
    echo "Namespace $namespace belum Active. Status saat ini: ${phase:-belum ada}"
    exit 1
  fi
done

echo "Step 1 benar: Namespace dev dan prod sudah siap digunakan."
