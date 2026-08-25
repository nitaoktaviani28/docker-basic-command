#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-os ]; then
  echo "File /tmp/answer-os belum ada"
  exit 1
fi

if [ ! -f /tmp/answer-k8s-version ]; then
  echo "File /tmp/answer-k8s-version belum ada"
  exit 1
fi

answer_os="$(sed -e 's/[[:space:]]*$//' /tmp/answer-os)"
answer_ver="$(tr -d '[:space:]' < /tmp/answer-k8s-version)"

expected_os="$(kubectl get nodes -o jsonpath='{.items[0].status.nodeInfo.osImage}')"
expected_ver="$(kubectl get nodes -o jsonpath='{.items[0].status.nodeInfo.kubeletVersion}')"

if [ "$answer_os" != "$expected_os" ]; then
  echo "Jawaban OS salah. Expected: $expected_os, Dapat: $answer_os"
  exit 1
fi

if [ "$answer_ver" != "$expected_ver" ]; then
  echo "Jawaban versi Kubernetes salah. Expected: $expected_ver, Dapat: $answer_ver"
  exit 1
fi

echo "Step 2 benar"
