# Step 2 - Cek OS dan Versi Kubernetes

Di langkah ini, kamu akan mengambil detail node untuk mengetahui OS dan versi Kubernetes.

Jalankan:

```bash
kubectl get nodes -o wide
```

Ambil dua informasi berikut dari output:

- OS image dari kolom OS-IMAGE.
- Versi Kubernetes dari kolom VERSION.

Simpan jawaban ke file:

```bash
echo "Ubuntu 22.04.4 LTS" > /tmp/answer-os
echo "v1.30.0" > /tmp/answer-k8s-version
```

Nilai di atas hanya contoh. Wajib ganti sesuai output lab kamu.
