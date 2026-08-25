# Step 5 - Memahami Self-Healing Deployment

Pada langkah ini, kamu akan belajar salah satu kemampuan penting Deployment, yaitu **self-healing**.

Self-healing berarti Kubernetes akan menjaga agar jumlah Pod aktual tetap sesuai dengan jumlah replica yang diinginkan.

Saat ini Deployment `nginx-yaml` memiliki `4` replica.

Cek Pod yang berjalan:

```bash
kubectl get pods -l app=nginx-yaml
```

Ambil salah satu nama Pod dari output tersebut, lalu hapus Pod tersebut.

Contoh:

```bash
kubectl delete pod <nama-pod>
```

Atau gunakan command berikut untuk menghapus `1` Pod secara otomatis sekaligus menyimpan namanya untuk proses verifikasi:

```bash
POD_NAME=$(kubectl get pods -l app=nginx-yaml -o jsonpath='{.items[0].metadata.name}')
echo "$POD_NAME" > /tmp/deleted-pod-name
kubectl delete pod $POD_NAME
```

Setelah Pod dihapus, segera cek Pod kembali:

```bash
kubectl get pods -l app=nginx-yaml
```

Kamu akan melihat Kubernetes membuat Pod baru secara otomatis.

Mengapa hal ini terjadi?

Karena Deployment memiliki ReplicaSet yang bertugas memastikan jumlah Pod selalu sesuai dengan nilai `replicas`.

Cek ReplicaSet:

```bash
kubectl get rs
```

Cek Deployment:

```bash
kubectl get deployment nginx-yaml
```

Pastikan jumlah Pod kembali menjadi `4` dan semua Pod `Running`.

Setelah itu klik **Check**.
