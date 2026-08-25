# Step 1 - Membuat Deployment dengan kubectl command

Pada langkah ini, kamu akan membuat Deployment menggunakan command `kubectl`.

Deployment berbeda dengan Pod biasa. Jika Pod dibuat langsung, Pod tersebut tidak otomatis dibuat ulang oleh controller ketika dihapus. Sebaliknya, jika Pod dibuat melalui Deployment, Kubernetes akan menjaga jumlah Pod tetap sesuai dengan jumlah replica yang diinginkan.

Jalankan command berikut:

```bash
kubectl create deployment nginx-command --image=nginx:1.25
```

Command tersebut akan membuat Deployment bernama `nginx-command` dengan image `nginx:1.25`.

Cek Deployment yang sudah dibuat:

```bash
kubectl get deployment
```

Atau cek Deployment tertentu:

```bash
kubectl get deployment nginx-command
```

Cek Pod yang dibuat oleh Deployment:

```bash
kubectl get pods
```

Kamu juga dapat melihat label Pod dengan command:

```bash
kubectl get pods --show-labels
```

Deployment akan membuat Pod secara otomatis. Nama Pod biasanya memiliki format seperti berikut:

```text
nginx-command-xxxxxxxxxx-xxxxx
```

Setelah Deployment `nginx-command` berhasil dibuat dan tersedia, klik **Check**.
