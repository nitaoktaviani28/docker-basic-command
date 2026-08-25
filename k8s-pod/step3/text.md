# Step 3 - Mengecek image dan container dalam Pod

Pada langkah ini, kamu akan mengecek image dan nama container yang digunakan oleh Pod.

Gunakan Pod yang sebelumnya sudah dibuat, yaitu:

```text
nginx-command
```

Untuk melihat detail Pod, jalankan:

```bash
kubectl describe pod nginx-command
```

Pada output tersebut, perhatikan bagian:

```text
Containers:
  nginx-command:
    Image: nginx:latest
```

Kamu juga dapat mengambil nama container dengan command berikut:

```bash
kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].name}'
```

Untuk mengambil image container:

```bash
kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].image}'
```

Sekarang simpan jawaban kamu:

```bash
kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].name}' > /tmp/answer-container-name
kubectl get pod nginx-command -o jsonpath='{.spec.containers[0].image}' > /tmp/answer-container-image
```

Setelah itu klik **Check**.
