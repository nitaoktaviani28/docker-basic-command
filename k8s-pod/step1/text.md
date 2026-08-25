# Step 1 - Membuat Pod dengan kubectl command

Pada langkah ini, kamu akan membuat Pod menggunakan command `kubectl`.

Jalankan command berikut:

```bash
kubectl run nginx-command --image=nginx:latest
```

Command di atas akan membuat Pod bernama `nginx-command` dengan image `nginx:latest`.

Setelah itu, cek status Pod dengan command berikut:

```bash
kubectl get pods
```

Kamu juga bisa mengecek Pod tertentu dengan command:

```bash
kubectl get pod nginx-command
```

Pastikan Pod berada dalam status `Running`.

Contoh output:

```text
NAME            READY   STATUS    RESTARTS   AGE
nginx-command   1/1     Running   0          20s
```

Setelah Pod berhasil dibuat, klik **Check**.
