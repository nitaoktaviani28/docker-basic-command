# Step 1 - Cek Jumlah Node Minikube

Pada langkah ini, kamu akan memastikan cluster Minikube aktif lalu mengecek jumlah node.

## 1. Cek status Minikube

```bash
minikube status
```

Jika belum running, nyalakan dengan:

```bash
minikube start
```

## 2. Cek daftar node Kubernetes

```bash
kubectl get nodes
```

Hitung jumlah node pada output.

Contoh jika ada 2 node, simpan jawaban seperti ini:

```bash
echo "2" > /tmp/answer-node-count
```

Ganti angka sesuai hasil di environment kamu, lalu klik Check.
