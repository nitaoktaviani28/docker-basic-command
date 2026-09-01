# Membuat Namespace dan ResourceQuota

Pada tahap ini, buat Namespace khusus bernama `quota-lab`, lalu terapkan ResourceQuota yang membatasi penggunaan resource di dalamnya.

```bash
mkdir -p manifests

cat <<EOF > manifests/namespace-quota-lab.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: quota-lab
EOF

kubectl apply -f manifests/namespace-quota-lab.yaml
```

Buat ResourceQuota berikut:

```bash
cat <<EOF > manifests/resource-quota.yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: quota-lab-limit
  namespace: quota-lab
spec:
  hard:
    pods: "5"
    requests.cpu: "500m"
    requests.memory: "512Mi"
    limits.cpu: "1000m"
    limits.memory: "1Gi"
EOF

kubectl apply -f manifests/resource-quota.yaml
kubectl get resourcequota -n quota-lab
kubectl describe resourcequota quota-lab-limit -n quota-lab
```

Quota ini mengizinkan maksimal 5 Pod, total CPU request 500m, memory request 512Mi, CPU limit 1000m, dan memory limit 1Gi.

Klik **Check** setelah Namespace dan ResourceQuota tersedia.
