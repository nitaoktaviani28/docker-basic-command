# Scale Replica Deployment

Pada tahap ini, kamu akan menambah jumlah replica Deployment dari 2 menjadi 4.

Jalankan scale up berikut:

```bash
kubectl scale deployment nginx-rollout -n rollout-lab --replicas=4
```

Periksa Deployment dan Pod yang dibuat:

```bash
kubectl get deployment nginx-rollout -n rollout-lab
```

```bash
kubectl get pods -n rollout-lab -l app=nginx-rollout
```

```bash
kubectl get deployment nginx-rollout -n rollout-lab -o jsonpath='{.spec.replicas}'
```

```bash
echo
```

Output jumlah replica yang diharapkan adalah `4`.

Untuk melihat efek scale down, coba kurangi replica menjadi 2:

```bash
kubectl scale deployment nginx-rollout -n rollout-lab --replicas=2
```

```bash
kubectl get pods -n rollout-lab -l app=nginx-rollout
```

Kemudian scale kembali ke 4 replica untuk tahap berikutnya:

```bash
kubectl scale deployment nginx-rollout -n rollout-lab --replicas=4
```

```bash
kubectl rollout status deployment/nginx-rollout -n rollout-lab
```

Klik **Check** setelah Deployment memiliki 4 replica `Ready`.
