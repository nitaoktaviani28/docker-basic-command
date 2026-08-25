#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-container-name ]; then
  echo "File /tmp/answer-container-name belum ada"
  exit 1
fi

if [ ! -f /tmp/answer-container-image ]; then
  echo "File /tmp/answer-container-image belum ada"
  exit 1
fi

if ! kubectl get pod nginx-command >/dev/null 2>&1; then
  echo "Pod nginx-command belum ditemukan"
  exit 1
fi

answer_name="$(tr -d '[:space:]' < /tmp/answer-container-name)"
answer_image="$(tr -d '[:space:]' < /tmp/answer-container-image)"
actual_name="$(kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].name}')"
actual_image="$(kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].image}')"

if [ "$answer_name" != "$actual_name" ]; then
  echo "Nama container salah. Expected: $actual_name, Dapat: $answer_name"
  exit 1
fi

if [ "$answer_image" != "$actual_image" ]; then
  echo "Image container salah. Expected: $actual_image, Dapat: $answer_image"
  exit 1
fi

echo "Step 3 benar: nama container dan image Pod sudah sesuai."
