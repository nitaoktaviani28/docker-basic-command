# Step 6 - Memahami Struktur YAML Deployment

Pada langkah ini, kamu akan mempelajari struktur YAML Deployment.

Tampilkan YAML Deployment yang sudah berjalan:

```bash
kubectl get deployment nginx-yaml -o yaml
```

Kamu juga dapat membuka file manifest yang sebelumnya dibuat:

```bash
cat manifests/nginx-deployment.yaml
```

Struktur dasar Deployment adalah sebagai berikut:

```yaml
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
```

Penjelasan struktur penting:

`apiVersion`

```yaml
apiVersion: apps/v1
```

Menentukan versi API Kubernetes yang digunakan untuk resource Deployment.

`kind`

```yaml
kind: Deployment
```

Menentukan jenis resource yang dibuat, yaitu Deployment.

`metadata`

```yaml
metadata:
  name: nginx-yaml
  labels:
    app: nginx-yaml
```

Berisi identitas resource, seperti nama dan label.

`spec.replicas`

```yaml
spec:
  replicas: 2
```

Menentukan jumlah Pod yang ingin dijalankan oleh Deployment.

`spec.selector`

```yaml
selector:
  matchLabels:
    app: nginx-yaml
```

Digunakan Deployment untuk memilih Pod yang dikelola.

Nilai selector harus cocok dengan label pada Pod template.

`spec.template`

```yaml
template:
  metadata:
    labels:
      app: nginx-yaml
```

Template adalah cetakan Pod yang akan dibuat oleh Deployment.

Label di bagian template harus sesuai dengan selector Deployment.

`spec.template.spec.containers`

```yaml
containers:
  - name: nginx-container
    image: nginx:1.25
    ports:
      - containerPort: 80
```

Bagian ini mendefinisikan container yang berjalan di dalam Pod.

Sekarang simpan jawaban struktur penting Deployment ke file berikut:

```bash
echo "apps/v1" > /tmp/answer-deployment-apiversion
echo "Deployment" > /tmp/answer-deployment-kind
echo "nginx-yaml" > /tmp/answer-deployment-name
echo "app=nginx-yaml" > /tmp/answer-deployment-selector
echo "nginx-container" > /tmp/answer-deployment-container
```

Setelah itu klik **Check**.
