#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-broken-pod-status ]; then
  echo "File /tmp/answer-broken-pod-status belum ada"
  exit 1
fi

if ! kubectl get pod broken-pod >/dev/null 2>&1; then
  echo "Pod broken-pod belum ditemukan"
  exit 1
fi

answer="$(tr -d '[:space:]' < /tmp/answer-broken-pod-status)"
actual="$(kubectl get pod broken-pod -o jsonpath='{.status.containerStatuses[0].state.waiting.reason}' 2>/dev/null || true)"

if [ -z "$actual" ]; then
  echo "Status waiting pada broken-pod belum tersedia. Coba tunggu beberapa detik lalu Check lagi."
  exit 1
fi

case "$actual" in
  ErrImagePull|ImagePullBackOff)
    ;;
  *)
    echo "broken-pod belum masuk status error image pull. Status saat ini: $actual"
    exit 1
    ;;
esac

if [ "$answer" != "$actual" ]; then
  echo "Jawaban status broken-pod salah. Expected: $actual, Dapat: $answer"
  exit 1
fi

echo "Step 2 benar: broken-pod gagal karena image tidak valid dengan status $actual."
