# Step 4 - Update Image dan Rolling Update Deployment

Pada langkah ini, kamu akan mengupdate image Deployment.

Saat ini Deployment `nginx-yaml` memiliki `4` replica. Ketika image diupdate, Kubernetes tidak langsung mematikan semua Pod secara bersamaan. Sebagai gantinya, Kubernetes melakukan update secara bertahap. Proses ini disebut **rolling update**.

Cek image saat ini:

```bash
kubectl get deployment nginx-yaml -o jsonpath='{.spec.template.spec.containers[0].image}'
```

Update image Deployment dari `nginx:1.25` menjadi `nginx:1.26`:

```bash
kubectl set image deployment/nginx-yaml nginx-container=nginx:1.26
```

Cek status rollout:

```bash
kubectl rollout status deployment/nginx-yaml
```

Cek riwayat rollout:

```bash
kubectl rollout history deployment/nginx-yaml
```

Cek Deployment:

```bash
kubectl get deployment nginx-yaml
```

Cek Pod:

```bash
kubectl get pods -l app=nginx-yaml
```

Cek image yang digunakan Deployment:

```bash
kubectl get deployment nginx-yaml -o jsonpath='{.spec.template.spec.containers[0].image}'
```

Jika ingin melihat detail strategi update, jalankan:

```bash
kubectl describe deployment nginx-yaml
```

Perhatikan bagian:

```text
StrategyType: RollingUpdate
```

Setelah image berhasil berubah menjadi `nginx:1.26` dan Deployment tetap memiliki `4` replica, klik **Check**.
