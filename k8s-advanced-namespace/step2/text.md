# Nama Resource dalam Namespace yang Sama

Nama resource Kubernetes harus unik di dalam Namespace yang sama. Pada tahap ini, kamu akan membuat Deployment `nginx-app` di Namespace `default`, lalu mencoba membuatnya sekali lagi dengan nama yang sama.

Buat manifest Deployment pertama:

```bash
cat <<EOF > manifests/nginx-app-default.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
  namespace: default
  labels:
    app: nginx-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-app
  template:
    metadata:
      labels:
        app: nginx-app
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
kubectl apply -f manifests/nginx-app-default.yaml
kubectl get deployment nginx-app -n default
```

Tunggu sampai kolom `AVAILABLE` bernilai `1`.

Sekarang coba buat Deployment kedua dengan nama yang sama pada Namespace `default`:

```bash
kubectl create deployment nginx-app --image=nginx:1.26 -n default
```

Command tersebut akan gagal dengan error `AlreadyExists`. Simpan error tersebut sebagai jawaban verifikasi:

```bash
kubectl create deployment nginx-app --image=nginx:1.26 -n default 2> /tmp/answer-same-namespace-error || true
cat /tmp/answer-same-namespace-error
```

Hasil ini menunjukkan bahwa satu Namespace tidak dapat memiliki dua Deployment dengan nama yang sama. Setelah error tersimpan, klik **Check**.
