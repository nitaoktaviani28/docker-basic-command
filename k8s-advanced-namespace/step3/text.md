# Nama Sama di Namespace Berbeda

Namespace memiliki ruang nama masing-masing. Deployment `nginx-app` sudah ada di `dev` dari tahap sebelumnya. Sekarang kamu akan memakai nama yang sama di Namespace `default` dan `prod`.

Buat manifest untuk Namespace `default`:

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

Terapkan manifest tersebut:

```bash
kubectl apply -f manifests/nginx-app-default.yaml
```

Kemudian buat manifest untuk environment production:

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

Periksa Deployment dengan nama sama tersebut di setiap Namespace:

```bash
kubectl get deployment nginx-app -n default
kubectl get deployment nginx-app -n dev
kubectl get deployment nginx-app -n prod
kubectl get deploy -A
```

Kamu juga dapat membandingkan image yang dipakai:

```bash
kubectl get deployment nginx-app -n default -o jsonpath='{.spec.template.spec.containers[0].image}'
kubectl get deployment nginx-app -n dev -o jsonpath='{.spec.template.spec.containers[0].image}'
kubectl get deployment nginx-app -n prod -o jsonpath='{.spec.template.spec.containers[0].image}'
```

Target lab ini adalah:

```text
default = nginx:1.25
dev     = nginx:1.25
prod    = nginx:1.26
```

Klik **Check** setelah ketiga Deployment tersedia.
