# Step 1 - Cek Jumlah Node Kubernetes

Pada langkah ini, kamu akan mengecek jumlah node pada cluster Kubernetes.

Di skenario ini, targetnya adalah:

- 1 node control-plane (master)
- 1 node worker

## 1. Cek daftar node Kubernetes

```bash
kubectl get nodes
```

Perhatikan kolom `ROLES` lalu pastikan ada:

- satu node dengan role `control-plane`
- satu node worker (biasanya tampil sebagai `<none>` di kolom `ROLES`)

Jumlah total node berarti `2`.

Simpan jawaban ke file:

```bash
echo "2" > /tmp/answer-node-count
```

Lalu klik Check.

Jika sementara baru terlihat 1 node, tunggu 20-60 detik lalu jalankan ulang `kubectl get nodes` sampai node worker muncul.
