#!/bin/bash
set -euo pipefail

if [ ! -f /tmp/answer-master-count ]; then
  echo "File /tmp/answer-master-count belum ada"
  exit 1
fi

if [ ! -f /tmp/answer-master-hostname ]; then
  echo "File /tmp/answer-master-hostname belum ada"
  exit 1
fi

answer_count="$(tr -d '[:space:]' < /tmp/answer-master-count)"
answer_hosts="$(tr -d '[:space:]' < /tmp/answer-master-hostname)"

controlplane_nodes="$(kubectl get nodes -l node-role.kubernetes.io/control-plane --no-headers 2>/dev/null | awk '{print $1}' || true)"
if [ -z "$controlplane_nodes" ]; then
  controlplane_nodes="$(kubectl get nodes -l node-role.kubernetes.io/master --no-headers 2>/dev/null | awk '{print $1}' || true)"
fi

expected_count="$(echo "$controlplane_nodes" | sed '/^$/d' | wc -l | tr -d '[:space:]')"
expected_hosts="$(echo "$controlplane_nodes" | sed '/^$/d' | paste -sd, -)"

if [ "$answer_count" != "$expected_count" ]; then
  echo "Jawaban jumlah control-plane salah. Expected: $expected_count, Dapat: $answer_count"
  exit 1
fi

if [ "$answer_hosts" != "$expected_hosts" ]; then
  echo "Jawaban hostname control-plane salah. Expected: $expected_hosts, Dapat: $answer_hosts"
  exit 1
fi

echo "Step 3 benar"
