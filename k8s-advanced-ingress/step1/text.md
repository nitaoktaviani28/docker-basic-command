# Menyiapkan Ingress Controller dan Namespace

Object Ingress membutuhkan **Ingress Controller** agar aturan routing benar-benar diproses. Pada lab ini kita menggunakan `ingress-nginx` dan Namespace `ingress-lab` untuk resource aplikasi.

Install ingress-nginx menggunakan manifest bare-metal:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.15.1/deploy/static/provider/baremetal/deploy.yaml
```

Tunggu controller siap. Proses download image bisa memerlukan waktu beberapa menit:

```bash
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s
```

Periksa Pod, Service, dan IngressClass controller:

```bash
kubectl get pods -n ingress-nginx
kubectl get svc ingress-nginx-controller -n ingress-nginx
kubectl get ingressclass
```

Pada cluster kubeadm atau bare-metal, Service controller biasanya bertipe `NodePort`. IngressClass yang dipakai nanti bernama `nginx`.

Buat Namespace untuk backend aplikasi:

```bash
mkdir -p manifests

cat <<EOF > manifests/namespace-ingress-lab.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-lab
EOF

kubectl apply -f manifests/namespace-ingress-lab.yaml
kubectl get namespace ingress-lab
```

Klik **Check** setelah controller siap dan Namespace `ingress-lab` berstatus `Active`.
