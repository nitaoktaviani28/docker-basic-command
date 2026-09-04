# Nama Resource dalam Namespace yang Sama

Nama resource Kubernetes harus unik di dalam Namespace yang sama. Pada tahap ini, kamu akan membuat Deployment `nginx-app` di Namespace `dev`, lalu mencoba membuatnya sekali lagi dengan nama yang sama.

Buat manifest Deployment pertama:

```bash
cat <<EOF > manifests/nginx-app-dev.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
  namespace: dev
  labels:
    app: nginx-app
    environment: dev
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-app
      environment: dev
  template:
    metadata:
      labels:
        app: nginx-app
        environment: dev
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
EOF
```

Terapkan manifest dan cek statusnya:

```bash
kubectl apply -f manifests/nginx-app-dev.yaml
```

```bash
kubectl get deployment nginx-app -n dev
```

Tunggu sampai kolom `AVAILABLE` bernilai `1`.

Sekarang coba buat Deployment kedua dengan nama yang sama pada Namespace `dev`:

```bash
kubectl create deployment nginx-app --image=nginx:1.26 -n dev
```

Command tersebut akan gagal karena Deployment dengan nama itu sudah ada. Format pesan dapat berbeda antar versi Kubernetes, misalnya `AlreadyExists` atau `already exists`. Simpan error tersebut sebagai jawaban verifikasi:

```bash
kubectl create deployment nginx-app --image=nginx:1.26 -n dev 2> /tmp/answer-same-namespace-error || true
```

```bash
cat /tmp/answer-same-namespace-error
```

Hasil ini menunjukkan bahwa satu Namespace tidak dapat memiliki dua Deployment dengan nama yang sama. Setelah error tersimpan, klik **Check**.
