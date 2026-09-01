# Menggunakan ConfigMap dan Secret pada Deployment

Pada tahap terakhir, kamu akan memasukkan seluruh value dari `app-config-yaml` dan `app-secret-yaml` ke container sebagai environment variable menggunakan `envFrom`.

Buat manifest Deployment berikut:

```bash
cat <<EOF > manifests/nginx-env-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-env-demo
  labels:
    app: nginx-env-demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-env-demo
  template:
    metadata:
      labels:
        app: nginx-env-demo
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          envFrom:
            - configMapRef:
                name: app-config-yaml
            - secretRef:
                name: app-secret-yaml
          ports:
            - containerPort: 80
EOF
```

Terapkan Deployment dan tunggu hingga Pod berstatus `Running`:

```bash
kubectl apply -f manifests/nginx-env-deployment.yaml
kubectl get deployment nginx-env-demo
kubectl get pods -l app=nginx-env-demo
```

Ambil nama Pod, lalu lihat environment variable di dalam container:

```bash
POD_NAME=$(kubectl get pods -l app=nginx-env-demo -o jsonpath='{.items[0].metadata.name}')
kubectl exec "$POD_NAME" -- env | grep -E 'APP_NAME|APP_ENV|APP_PORT|LOG_LEVEL|DB_USERNAME|DB_PASSWORD|API_KEY'
```

Value yang diharapkan:

```text
APP_NAME=demo-yaml
APP_ENV=production
APP_PORT=8080
LOG_LEVEL=info
DB_USERNAME=yamluser
DB_PASSWORD=yamlpass123
API_KEY=yaml-api-key-12345
```

Simpan hasilnya untuk verifikasi:

```bash
kubectl exec "$POD_NAME" -- env | grep -E 'APP_NAME|APP_ENV|APP_PORT|LOG_LEVEL|DB_USERNAME|DB_PASSWORD|API_KEY' > /tmp/answer-env-result
cat /tmp/answer-env-result
```

Klik **Check** setelah seluruh value terlihat di dalam container.
