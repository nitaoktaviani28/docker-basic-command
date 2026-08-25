# Step 1 - Cek Jumlah Node Kubernetes

Pada langkah ini, kamu diminta untuk mengecek jumlah node yang ada pada Kubernetes cluster.

Jalankan command berikut:

```bash
kubectl get nodes
```

Perhatikan jumlah node yang muncul pada output command tersebut.

Contoh output:

```text
NAME           STATUS   ROLES           AGE   VERSION
controlplane   Ready    control-plane   10m   v1.30.0
node01         Ready    <none>          10m   v1.30.0
```

Dari output tersebut, terlihat bahwa jumlah node adalah `2`.

Jalankan command berikut untuk menyimpan jawaban kamu. Angka `2` di bawah hanya contoh dan harus disesuaikan dengan jumlah node pada lab kamu:

```bash
echo "2" > /tmp/answer-node-count
```

Setelah itu klik **Check**.
