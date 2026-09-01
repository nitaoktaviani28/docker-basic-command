# Troubleshoot Replica Gagal karena ResourceQuota

Sekarang isi sisa quota CPU request dengan Deployment kedua. `nginx-limited` sudah menggunakan `200m`; dua Pod `nginx-scale-test` akan memakai `2 x 150m = 300m`. Totalnya tepat `500m`, yaitu batas quota.

```bash
cat <<EOF > manifests/nginx-scale-test-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-scale-test
  namespace: quota-lab
  labels:
    app: nginx-scale-test
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx-scale-test
  template:
    metadata:
      labels:
        app: nginx-scale-test
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          resources:
            requests:
              cpu: "150m"
              memory: "128Mi"
            limits:
              cpu: "300m"
              memory: "256Mi"
EOF

kubectl apply -f manifests/nginx-scale-test-deployment.yaml
kubectl rollout status deployment/nginx-scale-test -n quota-lab
```

Coba scale menjadi 3 replica:

```bash
kubectl scale deployment nginx-scale-test -n quota-lab --replicas=3
kubectl get deployment nginx-scale-test -n quota-lab
kubectl get events -n quota-lab --sort-by=.lastTimestamp | grep -i quota
```

Replica ketiga membutuhkan tambahan CPU request `150m`, tetapi quota sudah penuh. Deployment tetap memiliki target 3 replica, sedangkan Pod ketiga ditolak dan jumlah `Ready` tidak mencapai 3.

Simpan pesan error quota:

```bash
kubectl get events -n quota-lab --sort-by=.lastTimestamp | grep -i quota > /tmp/answer-quota-error || true
cat /tmp/answer-quota-error
```

Klik **Check** setelah kamu melihat error `exceeded quota` atau pesan quota yang setara.
