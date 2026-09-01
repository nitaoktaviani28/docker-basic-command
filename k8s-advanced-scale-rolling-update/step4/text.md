# Rollback Deployment

Rollback digunakan ketika versi baru aplikasi bermasalah dan kamu perlu kembali ke revision sebelumnya. Pada tahap ini, image `nginx:1.26` akan dikembalikan ke `nginx:1.25`.

Lihat riwayat rollout terlebih dahulu:

```bash
kubectl rollout history deployment/nginx-rollout -n rollout-lab
```

Kembalikan Deployment ke revision sebelumnya:

```bash
kubectl rollout undo deployment/nginx-rollout -n rollout-lab
```

Tunggu rollback selesai:

```bash
kubectl rollout status deployment/nginx-rollout -n rollout-lab
```

Verifikasi image dan jumlah replica:

```bash
kubectl get deployment nginx-rollout -n rollout-lab
kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.template.spec.containers[0].image}'
echo
```

Image harus kembali ke `nginx:1.25`. Jumlah replica tidak berubah karena rollback hanya mengembalikan template Pod, sehingga Deployment tetap memiliki 4 replica.

Klik **Check** setelah image kembali ke `nginx:1.25` dan 4 replica sudah `Ready`.
