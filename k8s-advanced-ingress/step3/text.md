# Membuat Backend Green

Sekarang buat backend kedua bernama Green App. Backend ini memiliki pola yang sama dengan Blue App, tetapi akan memberi response yang berbeda.

Buat Deployment `web-green`:

```bash
cat <<EOF > manifests/web-green-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-green
  namespace: ingress-lab
  labels:
    app: web-green
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web-green
  template:
    metadata:
      labels:
        app: web-green
    spec:
      containers:
        - name: http-echo
          image: hashicorp/http-echo
          args:
            - "-text=Hello from Green App via Ingress"
            - "-listen=:5678"
          ports:
            - containerPort: 5678
EOF
```

```bash
kubectl apply -f manifests/web-green-deployment.yaml
```

```bash
kubectl get deployment web-green -n ingress-lab
```

```bash
kubectl get pods -n ingress-lab -l app=web-green
```

Buat Service untuk Green App:

```bash
cat <<EOF > manifests/web-green-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: svc-web-green
  namespace: ingress-lab
  labels:
    app: web-green
spec:
  type: ClusterIP
  selector:
    app: web-green
  ports:
    - name: http
      port: 80
      targetPort: 5678
EOF
```

```bash
kubectl apply -f manifests/web-green-service.yaml
```

```bash
kubectl get svc svc-web-green -n ingress-lab
```

```bash
kubectl get endpoints svc-web-green -n ingress-lab
```

Klik **Check** setelah Service memiliki endpoint dan Pod Green berstatus `Running`.
