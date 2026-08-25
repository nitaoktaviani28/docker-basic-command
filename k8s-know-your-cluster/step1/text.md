# Step 1 - Cek Jumlah Node Kubernetes

Pada langkah pertama ini, kamu akan mengecek berapa jumlah node yang tersedia di cluster Kubernetes.

Jalankan command berikut:

```bash
kubectl get nodes
```

Perhatikan berapa banyak node yang muncul pada output command tersebut.

Contoh output:

```text
NAME           STATUS   ROLES           AGE   VERSION
controlplane   Ready    control-plane   10m   v1.30.0
node01         Ready    <none>          10m   v1.30.0
```

Dari output tersebut, terlihat bahwa jumlah node adalah `2`.

Sekarang simpan jawaban kamu ke file berikut. Angka `2` di bawah hanya contoh, jadi sesuaikan dengan hasil yang muncul pada environment kamu:

```bash
echo "2" > /tmp/answer-node-count
```

Setelah itu klik **Check** untuk melanjutkan ke langkah berikutnya.
