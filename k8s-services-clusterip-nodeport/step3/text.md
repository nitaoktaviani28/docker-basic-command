# Step 3 - Membuat Deployment WordPress sebagai client

Pada langkah ini, kamu akan membuat Deployment **WordPress** sebagai aplikasi frontend yang akan terhubung ke backend MySQL melalui Service `ClusterIP`.

WordPress akan menggunakan nama Service `mysql-service` sebagai host database. Inilah alasan Service sangat penting: aplikasi tidak perlu tahu IP Pod backend secara langsung.

Buat file `manifests/wordpress-deployment.yaml`:

```bash
cat <<EOF > manifests/wordpress-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress-client
  labels:
    app: wordpress-client
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wordpress-client
  template:
    metadata:
      labels:
        app: wordpress-client
    spec:
      containers:
        - name: wordpress
          image: wordpress:6.5-apache
          env:
            - name: WORDPRESS_DB_HOST
              value: mysql-service:3306
            - name: WORDPRESS_DB_USER
              value: wpuser
            - name: WORDPRESS_DB_PASSWORD
              value: wppass123
            - name: WORDPRESS_DB_NAME
              value: wordpress
          ports:
            - containerPort: 80
EOF
```

Apply manifest tersebut:

```bash
kubectl apply -f manifests/wordpress-deployment.yaml
```

Cek Deployment:

```bash
kubectl get deployment wordpress-client
```

Cek Pod:

```bash
kubectl get pods -l app=wordpress-client
```

Jika ingin memastikan env database sudah benar, kamu bisa melihat detail Pod:

```bash
kubectl describe deployment wordpress-client
```

Pastikan WordPress berhasil berjalan dalam status `Running`.

Setelah Deployment `wordpress-client` berhasil dibuat, klik **Check**.
