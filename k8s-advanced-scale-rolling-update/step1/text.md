# Membuat Deployment Awal

Sebelum melakukan scaling dan update, siapkan Namespace `rollout-lab` dan Deployment `nginx-rollout` dengan 2 replica.

Buat folder manifest dan Namespace:

```bash
mkdir -p manifests

cat <<EOF > manifests/namespace-rollout-lab.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: rollout-lab
EOF

kubectl apply -f manifests/namespace-rollout-lab.yaml
```

Buat manifest Deployment awal menggunakan image `nginx:1.25`:

```bash
cat <<EOF > manifests/nginx-rollout.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-rollout
  namespace: rollout-lab
  labels:
    app: nginx-rollout
spec:
  replicas: 2
  strategy:
    type: RollingUpdate
  selector:
    matchLabels:
      app: nginx-rollout
  template:
    metadata:
      labels:
        app: nginx-rollout
    spec:
      containers:
        - name: nginx-container
          image: nginx:1.25
          ports:
            - containerPort: 80
EOF
```

Terapkan manifest dan tunggu dua Pod siap:

```bash
kubectl apply -f manifests/nginx-rollout.yaml
kubectl rollout status deployment/nginx-rollout -n rollout-lab
kubectl get deployment nginx-rollout -n rollout-lab
kubectl get pods -n rollout-lab -l app=nginx-rollout
```

Pastikan Deployment memiliki 2 replica `Ready`, menggunakan image `nginx:1.25`, lalu klik **Check**.
