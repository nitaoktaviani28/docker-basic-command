# Membuat Deployment dengan Requests dan Limits

Buat Deployment `nginx-limited` dengan 2 replica. Setiap container meminta CPU `100m` dan memory `64Mi`, dengan limit CPU `200m` dan memory `128Mi`.

```bash
cat <<EOF > manifests/nginx-limited-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-limited
  namespace: quota-lab
  labels:
    app: nginx-limited
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx-limited
  template:
    metadata:
      labels:
        app: nginx-limited
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
          resources:
            requests:
              cpu: "100m"
              memory: "64Mi"
            limits:
              cpu: "200m"
              memory: "128Mi"
EOF

kubectl apply -f manifests/nginx-limited-deployment.yaml
kubectl rollout status deployment/nginx-limited -n quota-lab
kubectl get pods -n quota-lab -l app=nginx-limited
```

Lihat konfigurasi resource pada Deployment:

```bash
kubectl get deployment nginx-limited -n quota-lab -o yaml
```

Karena ada 2 replica, penggunaan saat ini adalah CPU request `200m`, memory request `128Mi`, CPU limit `400m`, dan memory limit `256Mi`.

Klik **Check** setelah dua Pod sudah `Running`.
