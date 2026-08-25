#!/bin/bash
set -euo pipefail

for file in \
  /tmp/answer-deployment-apiversion \
  /tmp/answer-deployment-kind \
  /tmp/answer-deployment-name \
  /tmp/answer-deployment-selector \
  /tmp/answer-deployment-container
do
  if [ ! -f "$file" ]; then
    echo "File $file belum ada"
    exit 1
  fi
done

answer_api="$(tr -d '[:space:]' < /tmp/answer-deployment-apiversion)"
answer_kind="$(tr -d '[:space:]' < /tmp/answer-deployment-kind)"
answer_name="$(tr -d '[:space:]' < /tmp/answer-deployment-name)"
answer_selector="$(sed -e 's/[[:space:]]*$//' /tmp/answer-deployment-selector)"
answer_container="$(tr -d '[:space:]' < /tmp/answer-deployment-container)"

actual_api="$(kubectl get deployment nginx-yaml -o jsonpath='{.apiVersion}')"
actual_kind="$(kubectl get deployment nginx-yaml -o jsonpath='{.kind}')"
actual_name="$(kubectl get deployment nginx-yaml -o jsonpath='{.metadata.name}')"
actual_selector_key="$(kubectl get deployment nginx-yaml -o jsonpath='{.spec.selector.matchLabels.app}')"
actual_container="$(kubectl get deployment nginx-yaml -o jsonpath='{.spec.template.spec.containers[0].name}')"
actual_selector="app=$actual_selector_key"

if [ "$answer_api" != "$actual_api" ]; then
  echo "Jawaban apiVersion salah. Expected: $actual_api, Dapat: $answer_api"
  exit 1
fi

if [ "$answer_kind" != "$actual_kind" ]; then
  echo "Jawaban kind salah. Expected: $actual_kind, Dapat: $answer_kind"
  exit 1
fi

if [ "$answer_name" != "$actual_name" ]; then
  echo "Jawaban nama Deployment salah. Expected: $actual_name, Dapat: $answer_name"
  exit 1
fi

if [ "$answer_selector" != "$actual_selector" ]; then
  echo "Jawaban selector Deployment salah. Expected: $actual_selector, Dapat: $answer_selector"
  exit 1
fi

if [ "$answer_container" != "$actual_container" ]; then
  echo "Jawaban nama container salah. Expected: $actual_container, Dapat: $answer_container"
  exit 1
fi

echo "Step 6 benar: struktur penting Deployment berhasil diidentifikasi."
