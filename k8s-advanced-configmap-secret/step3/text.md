# Membuat ConfigMap dan Secret dari YAML

YAML adalah cara yang paling umum dipakai di environment production karena manifest dapat disimpan di Git, direview, dan diterapkan ulang.

Buat folder manifest:

```bash
mkdir -p manifests
```

Buat manifest ConfigMap:

```bash
cat <<EOF > manifests/app-config.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config-yaml
data:
  APP_NAME: "demo-yaml"
  APP_ENV: "production"
  APP_PORT: "8080"
  LOG_LEVEL: "info"
EOF
```

Terapkan dan periksa ConfigMap:

```bash
kubectl apply -f manifests/app-config.yaml
```

```bash
kubectl get configmap app-config-yaml
```

```bash
kubectl describe configmap app-config-yaml
```

Untuk Secret, Kubernetes menyediakan `data` dan `stringData`. Field `data` membutuhkan Base64, sedangkan `stringData` menerima plain text dan akan diubah Kubernetes menjadi Base64. Pada lab ini kita menggunakan `stringData` agar fokus pada konsepnya.

```bash
cat <<EOF > manifests/app-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: app-secret-yaml
type: Opaque
stringData:
  DB_USERNAME: "yamluser"
  DB_PASSWORD: "yamlpass123"
  API_KEY: "yaml-api-key-12345"
EOF
```

Terapkan Secret dan decode salah satu nilainya:

```bash
kubectl apply -f manifests/app-secret.yaml
```

```bash
kubectl get secret app-secret-yaml
```

```bash
kubectl get secret app-secret-yaml -o jsonpath='{.data.DB_PASSWORD}' | base64 -d
```

```bash
echo
```

Klik **Check** setelah ConfigMap dan Secret YAML tersedia.
