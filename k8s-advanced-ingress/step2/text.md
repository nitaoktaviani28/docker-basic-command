# Membuat Backend Blue

Ingress tidak mengarah langsung ke Pod, melainkan ke Service. Pada tahap ini kamu akan membuat backend pertama, yaitu Blue App, di Namespace `ingress-lab`.

Buat Deployment `web-blue` dengan HTTP server sederhana:

```bash
cat <<EOF > manifests/web-blue-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-blue
  namespace: ingress-lab
  labels:
    app: web-blue
spec:
  replicas: 1
  selector:
    matchLabels:
      app: web-blue
  template:
    metadata:
      labels:
        app: web-blue
    spec:
      containers:
        - name: http-echo
          image: hashicorp/http-echo
          args:
            - "-text=Hello from Blue App via Ingress"
            - "-listen=:5678"
          ports:
            - containerPort: 5678
EOF
```

```bash
kubectl apply -f manifests/web-blue-deployment.yaml
```

```bash
kubectl get deployment web-blue -n ingress-lab
```

```bash
kubectl get pods -n ingress-lab -l app=web-blue
```

Buat Service `ClusterIP` yang menjadi tujuan Ingress:

```bash
cat <<EOF > manifests/web-blue-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: svc-web-blue
  namespace: ingress-lab
  labels:
    app: web-blue
spec:
  type: ClusterIP
  selector:
    app: web-blue
  ports:
    - name: http
      port: 80
      targetPort: 5678
EOF
```

```bash
kubectl apply -f manifests/web-blue-service.yaml
```

```bash
kubectl get svc svc-web-blue -n ingress-lab
```

```bash
kubectl get endpoints svc-web-blue -n ingress-lab
```

Endpoint yang muncul menandakan Service sudah menemukan Pod Blue App. Klik **Check** setelah Pod siap.
