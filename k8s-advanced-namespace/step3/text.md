# Nama Sama di Namespace Berbeda

Namespace memiliki ruang nama masing-masing. Deployment `nginx-app` sudah ada di Namespace `dev` dari tahap sebelumnya. Sekarang kamu akan membuat Deployment dengan nama yang sama di Namespace `prod`.

Buat manifest untuk environment production:

```bash
cat <<EOF > manifests/nginx-app-prod.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-app
  namespace: prod
  labels:
    app: nginx-app
    environment: prod
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx-app
      environment: prod
  template:
    metadata:
      labels:
        app: nginx-app
        environment: prod
    spec:
      containers:
        - name: nginx
          image: nginx:1.26
          ports:
            - containerPort: 80
EOF
```

Terapkan manifest production:

```bash
kubectl apply -f manifests/nginx-app-prod.yaml
```

Periksa kedua Deployment dengan nama yang sama tersebut:

```bash
kubectl get deployment nginx-app -n dev
kubectl get deployment nginx-app -n prod
kubectl get deploy -A | grep nginx-app
```

Kamu juga dapat membandingkan image yang dipakai:

```bash
kubectl get deployment nginx-app -n dev -o jsonpath='{.spec.template.spec.containers[0].image}'
kubectl get deployment nginx-app -n prod -o jsonpath='{.spec.template.spec.containers[0].image}'
```

Target lab ini adalah:

```text
dev     = nginx:1.25
prod    = nginx:1.26
```

Walaupun namanya sama, keduanya dapat memiliki konfigurasi yang berbeda karena berada di Namespace yang berbeda.

Klik **Check** setelah Deployment di `dev` dan `prod` tersedia.
