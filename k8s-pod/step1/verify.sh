#!/bin/bash
set -euo pipefail

name="nginx-command"

if ! kubectl get pod "$name" >/dev/null 2>&1; then
  echo "Pod $name belum ditemukan"
  exit 1
fi

phase="$(kubectl get pod "$name" -o jsonpath='{.status.phase}')"

if [ "$phase" != "Running" ]; then
  echo "Pod $name belum Running. Status saat ini: $phase"
  exit 1
fi

echo "Step 1 benar: Pod $name berhasil dibuat dan statusnya Running."
