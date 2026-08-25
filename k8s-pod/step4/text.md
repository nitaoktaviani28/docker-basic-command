# Step 4 - Membuat Pod menggunakan YAML

Selain menggunakan command langsung seperti `kubectl run`, Pod juga dapat dibuat menggunakan file YAML.

File YAML lebih sering digunakan di environment production karena lebih mudah dibaca, disimpan, direview, dan digunakan ulang.

Buat folder manifest:

```bash
mkdir -p manifests
```

Buat file bernama `manifests/nginx-pod.yaml`:

```bash
cat <<EOF > manifests/nginx-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-yaml
  labels:
    app: nginx-yaml
spec:
  containers:
    - name: nginx-container
      image: nginx:latest
      ports:
        - containerPort: 80
EOF
```

Apply file YAML tersebut:

```bash
kubectl apply -f manifests/nginx-pod.yaml
```

Cek status Pod:

```bash
kubectl get pod nginx-yaml
```

Lihat detail Pod:

```bash
kubectl describe pod nginx-yaml
```

Lihat isi YAML dari Pod yang sudah dibuat di Kubernetes:

```bash
kubectl get pod nginx-yaml -o yaml
```

Pastikan Pod `nginx-yaml` berhasil dibuat dan statusnya `Running`.

Setelah itu klik **Check**.
