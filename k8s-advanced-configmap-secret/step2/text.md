# Membuat ConfigMap dan Secret dari File .env

File `.env` berisi pasangan `KEY=VALUE`. Format ini praktis saat konfigurasi aplikasi sudah tersedia dalam file sederhana.

Buat folder untuk file konfigurasi:

```bash
mkdir -p files
```

Buat file `.env` untuk ConfigMap:

```bash
cat <<EOF > files/app-config.env
APP_NAME=demo-env-file
APP_ENV=staging
APP_PORT=9090
LOG_LEVEL=debug
EOF
```

Buat ConfigMap dari file tersebut:

```bash
kubectl create configmap app-config-env --from-env-file=files/app-config.env
kubectl get configmap app-config-env
kubectl describe configmap app-config-env
```

Buat file `.env` untuk Secret:

```bash
cat <<EOF > files/app-secret.env
DB_USERNAME=envuser
DB_PASSWORD=envpass123
API_KEY=env-api-key-12345
EOF
```

Buat Secret dari file tersebut, lalu periksa API key-nya:

```bash
kubectl create secret generic app-secret-env --from-env-file=files/app-secret.env
kubectl get secret app-secret-env
kubectl get secret app-secret-env -o jsonpath='{.data.API_KEY}' | base64 -d
echo
```

Klik **Check** setelah kedua resource tersedia dengan value yang sesuai.
