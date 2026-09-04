# Membuat ConfigMap dan Secret dengan Command

Pada tahap ini, kamu akan membuat ConfigMap dan Secret secara langsung dengan `kubectl`.

Buat ConfigMap `app-config-command`:

```bash
kubectl create configmap app-config-command \
  --from-literal=APP_NAME=demo-command \
  --from-literal=APP_ENV=development \
  --from-literal=APP_PORT=8080
```

Periksa resource dan isi ConfigMap:

```bash
kubectl get configmap app-config-command
```

```bash
kubectl describe configmap app-config-command
```

```bash
kubectl get configmap app-config-command -o yaml
```

Sekarang buat Secret `app-secret-command`:

```bash
kubectl create secret generic app-secret-command \
  --from-literal=DB_USERNAME=admin \
  --from-literal=DB_PASSWORD=secret123
```

Lihat Secret yang dibuat:

```bash
kubectl get secret app-secret-command
```

```bash
kubectl describe secret app-secret-command
```

```bash
kubectl get secret app-secret-command -o yaml
```

Nilai Secret pada output YAML terlihat dalam Base64. Decode password untuk melihat nilai aslinya:

```bash
kubectl get secret app-secret-command -o jsonpath='{.data.DB_PASSWORD}' | base64 -d
```

```bash
echo
```

Klik **Check** setelah ConfigMap dan Secret berhasil dibuat.
