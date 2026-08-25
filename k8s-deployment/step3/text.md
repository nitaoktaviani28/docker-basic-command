# Step 3 - Scale Up dan Scale Down Deployment

Pada langkah ini, kamu akan belajar melakukan scaling pada Deployment.

Scaling adalah proses menambah atau mengurangi jumlah Pod replica dari sebuah Deployment.

Kita akan menggunakan Deployment `nginx-yaml`.

Cek jumlah replica saat ini:

```bash
kubectl get deployment nginx-yaml
```

Scale up Deployment menjadi `4` replica:

```bash
kubectl scale deployment nginx-yaml --replicas=4
```

Cek Deployment:

```bash
kubectl get deployment nginx-yaml
```

Cek Pod:

```bash
kubectl get pods -l app=nginx-yaml
```

Pastikan terdapat `4` Pod untuk Deployment `nginx-yaml`.

Setelah itu, coba lakukan scale down menjadi `2` replica:

```bash
kubectl scale deployment nginx-yaml --replicas=2
```

Cek kembali Pod:

```bash
kubectl get pods -l app=nginx-yaml
```

Jumlah Pod akan berkurang menjadi `2`.

Untuk kebutuhan step berikutnya, scale kembali Deployment menjadi `4` replica:

```bash
kubectl scale deployment nginx-yaml --replicas=4
```

Tunggu sampai semua Pod `Running`:

```bash
kubectl get pods -l app=nginx-yaml
```

Setelah Deployment `nginx-yaml` berada pada `4` replica dan semua Pod siap, klik **Check**.
