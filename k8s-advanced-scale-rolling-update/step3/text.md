# Rolling Update Deployment

Saat ini `nginx-rollout` menggunakan image `nginx:1.25` dan memiliki 4 replica. Sekarang lakukan rolling update ke `nginx:1.26`.

Lihat image yang digunakan saat ini:

```bash
kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.template.spec.containers[0].image}'
echo
```

Update image container:

```bash
kubectl set image deployment/nginx-rollout nginx-container=nginx:1.26 -n rollout-lab
```

Tunggu rollout selesai dan periksa riwayat revisinya:

```bash
kubectl rollout status deployment/nginx-rollout -n rollout-lab
kubectl rollout history deployment/nginx-rollout -n rollout-lab
```

Jika ingin melihat Pod lama dan baru berganti selama update, jalankan:

```bash
kubectl get pods -n rollout-lab -l app=nginx-rollout -w
```

Tekan `CTRL+C` setelah selesai mengamati perubahan.

Pastikan image sudah berubah dan semua replica kembali siap:

```bash
kubectl get deployment nginx-rollout -n rollout-lab
kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.template.spec.containers[0].image}'
echo
```

Klik **Check** setelah image menjadi `nginx:1.26` dan tersedia 4 replica.
