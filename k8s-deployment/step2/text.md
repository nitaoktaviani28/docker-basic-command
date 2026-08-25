# Step 2 - Membuat Deployment menggunakan YAML

Selain menggunakan command langsung, Deployment juga dapat dibuat menggunakan file YAML.

Pendekatan YAML lebih umum digunakan di environment production karena konfigurasinya bisa disimpan, dibaca ulang, direview, dan dikelola dengan Git.

Buat folder manifest:

```bash
mkdir -p manifests
```

Buat file `manifests/nginx-deployment.yaml`:

```bash
cat <<EOF > manifests/nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-yaml
  labels:
    app: nginx-yaml
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx-yaml
  template:
    metadata:
      labels:
        app: nginx-yaml
    spec:
      containers:
        - name: nginx-container
          image: nginx:1.25
          ports:
            - containerPort: 80
EOF
```

Apply manifest tersebut:

```bash
kubectl apply -f manifests/nginx-deployment.yaml
```

Cek Deployment:

```bash
kubectl get deployment nginx-yaml
```

Cek Pod yang dibuat oleh Deployment:

```bash
kubectl get pods -l app=nginx-yaml
```

Lihat detail Deployment:

```bash
kubectl describe deployment nginx-yaml
```

Setelah Deployment `nginx-yaml` berhasil dibuat dengan `2` replica, klik **Check**.
