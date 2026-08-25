# Step 2 - Membuat Service ClusterIP untuk MySQL

Pada langkah ini, kamu akan membuat Service bertipe **ClusterIP** untuk backend MySQL.

`ClusterIP` adalah tipe Service default di Kubernetes. Service ini hanya bisa diakses dari dalam cluster, sehingga cocok untuk komponen internal seperti database.

Service ini akan memberi WordPress alamat yang stabil untuk terhubung ke MySQL, meskipun Pod MySQL nanti berubah atau dibuat ulang.

Buat file `manifests/mysql-service.yaml`:

```bash
cat <<EOF > manifests/mysql-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
  labels:
    app: mysql-backend
spec:
  type: ClusterIP
  selector:
    app: mysql-backend
  ports:
    - name: mysql
      port: 3306
      targetPort: 3306
EOF
```

Apply Service:

```bash
kubectl apply -f manifests/mysql-service.yaml
```

Cek Service:

```bash
kubectl get svc mysql-service
```

Cek detail Service:

```bash
kubectl describe svc mysql-service
```

Cek endpoint Service:

```bash
kubectl get endpoints mysql-service
```

Jika endpoint muncul, berarti Service sudah berhasil mengarah ke Pod MySQL.

Setelah Service `mysql-service` berhasil dibuat, klik **Check**.
