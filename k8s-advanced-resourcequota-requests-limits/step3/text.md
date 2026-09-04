# Melihat Pemakaian ResourceQuota

ResourceQuota mencatat nilai yang sudah digunakan (`Used`) dan nilai maksimum (`Hard`). Setelah Deployment `nginx-limited` berjalan, periksa penggunaan quota:

```bash
kubectl describe resourcequota quota-lab-limit -n quota-lab
```

Atau tampilkan dalam YAML:

```bash
kubectl get resourcequota quota-lab-limit -n quota-lab -o yaml
```

Dengan 2 Pod `nginx-limited`, penggunaan yang diharapkan adalah:

```text
pods              2 dari 5
requests.cpu      200m dari 500m
requests.memory   128Mi dari 512Mi
limits.cpu        400m dari 1
limits.memory     256Mi dari 1Gi
```

Simpan hasil pemeriksaan quota:

```bash
kubectl describe resourcequota quota-lab-limit -n quota-lab > /tmp/answer-resourcequota-used
```

```bash
cat /tmp/answer-resourcequota-used
```

Klik **Check** setelah kamu melihat nilai `Used` dan `Hard`.
