# Membuat Namespace

Pada tahap ini, kamu akan membuat Namespace `dev` menggunakan command dan Namespace `prod` menggunakan manifest YAML.

Pertama, lihat Namespace bawaan cluster:

```bash
kubectl get namespaces
```

Kamu biasanya akan melihat Namespace seperti `default`, `kube-system`, `kube-public`, dan `kube-node-lease`.

Buat Namespace `dev` dengan command berikut:

```bash
kubectl create namespace dev
```

Pastikan Namespace tersebut tersedia:

```bash
kubectl get ns dev
```

Sekarang buat folder untuk menyimpan manifest:

```bash
mkdir -p manifests
```

Buat manifest Namespace `prod`:

```bash
cat <<EOF > manifests/namespace-prod.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: prod
EOF
```

Terapkan manifest tersebut:

```bash
kubectl apply -f manifests/namespace-prod.yaml
```

Periksa kedua Namespace:

```bash
kubectl get ns dev prod
kubectl describe namespace dev
kubectl describe namespace prod
```

Klik **Check** setelah Namespace `dev` dan `prod` berstatus `Active`.
