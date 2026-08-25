#!/bin/bash
set +e

# Tunggu API Kubernetes siap.
for i in $(seq 1 60); do
  kubectl get nodes >/dev/null 2>&1 && break
  sleep 2
done

# Tunggu sampai node menjadi 2 (1 control-plane + 1 worker).
for i in $(seq 1 90); do
  total=$(kubectl get nodes --no-headers 2>/dev/null | wc -l | tr -d '[:space:]')
  cp=$(kubectl get nodes --no-headers 2>/dev/null | awk '$3 ~ /control-plane|master/ {c++} END{print c+0}')

  if [ "$total" -ge 2 ] && [ "$cp" -ge 1 ]; then
    exit 0
  fi

  # Coba bantu worker registrasi bila host node01 tersedia.
  if getent hosts node01 >/dev/null 2>&1; then
    ssh -o ConnectTimeout=2 -o StrictHostKeyChecking=no node01 "sudo systemctl restart kubelet" >/dev/null 2>&1
  fi

  sleep 2
done

# Tidak memblokir step, tapi verifikasi akan gagal sampai cluster sesuai target.
exit 0
