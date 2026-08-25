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

Sekarang mari cek apakah WordPress benar-benar menggunakan Service `ClusterIP` milik MySQL.

## 1. Lihat ClusterIP dari MySQL Service

```bash
kubectl get svc mysql-service
```

Contoh output:

```text
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
mysql-service   ClusterIP   10.96.120.55    <none>        3306/TCP   1m
```

Di sini terlihat bahwa `mysql-service` memiliki alamat `ClusterIP` internal. Pod WordPress tidak perlu menghafal IP ini secara manual, karena cukup memakai nama Service `mysql-service`.

## 2. Pastikan env database pada WordPress sudah benar

Kamu bisa melihat detail Deployment:

```bash
kubectl describe deployment wordpress-client
```

Perhatikan environment variable berikut:

```text
WORDPRESS_DB_HOST=mysql-service:3306
```

## 3. Uji koneksi dari dalam Pod WordPress ke Service MySQL

Ambil nama Pod WordPress:

```bash
kubectl get pods -l app=wordpress-client
```

Lalu jalankan pengecekan koneksi TCP ke MySQL dari dalam Pod WordPress:

```bash
kubectl exec deploy/wordpress-client -- php -r '$fp=@fsockopen("mysql-service",3306,$errno,$errstr,5); if($fp){echo "connected to mysql-service:3306\n"; fclose($fp);} else {echo "failed: $errno $errstr\n"; exit(1);}'
```

Jika berhasil, akan muncul output seperti:

```text
connected to mysql-service:3306
```

Ini adalah bukti bahwa WordPress dapat menjangkau MySQL melalui Service `ClusterIP`.

Pastikan WordPress berhasil berjalan dalam status `Running`.

Setelah Deployment `wordpress-client` berhasil dibuat, klik **Check**.
