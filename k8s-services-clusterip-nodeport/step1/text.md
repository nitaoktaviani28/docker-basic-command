# Step 1 - Membuat Deployment MySQL sebagai backend

Pada langkah ini, kamu akan membuat Deployment untuk **MySQL** sebagai backend database.

MySQL akan digunakan oleh WordPress pada langkah berikutnya. Untuk saat ini, fokus kita adalah memastikan backend berhasil dibuat dan berjalan dengan baik.

Buat folder manifest:

```bash
mkdir -p manifests
```

Buat file `manifests/mysql-deployment.yaml`:

```bash
cat <<EOF > manifests/mysql-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-backend
  labels:
    app: mysql-backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql-backend
  template:
    metadata:
      labels:
        app: mysql-backend
    spec:
      containers:
        - name: mysql
          image: mysql:8.0
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: rootpass123
            - name: MYSQL_DATABASE
              value: wordpress
            - name: MYSQL_USER
              value: wpuser
            - name: MYSQL_PASSWORD
              value: wppass123
          ports:
            - containerPort: 3306
EOF
```

Apply manifest tersebut:

```bash
kubectl apply -f manifests/mysql-deployment.yaml
```

Cek Deployment:

```bash
kubectl get deployment mysql-backend
```

Cek Pod:

```bash
kubectl get pods -l app=mysql-backend
```

Pastikan Pod MySQL berada dalam status `Running`.

Setelah Deployment `mysql-backend` berhasil dibuat, klik **Check**.
