# Memahami OOMKilled karena Memory Limit

Sebelum membuat demo OOM, hapus `nginx-scale-test` agar quota kembali cukup:

```bash
kubectl delete deployment nginx-scale-test -n quota-lab
```

```bash
kubectl wait --for=delete pod -l app=nginx-scale-test -n quota-lab --timeout=90s
```

```bash
kubectl describe resourcequota quota-lab-limit -n quota-lab
```

Buat Pod yang terus mengalokasikan memory. Limit memory Pod ini hanya `64Mi`.

```bash
cat <<EOF > manifests/oom-demo-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: oom-demo
  namespace: quota-lab
  labels:
    app: oom-demo
spec:
  restartPolicy: OnFailure
  containers:
    - name: memory-hog
      image: python:3.11-alpine
      command:
        - python
        - -c
        - |
          blocks=[]
          while True:
              blocks.append(' ' * 1024 * 1024)
      resources:
        requests:
          cpu: "50m"
          memory: "32Mi"
        limits:
          cpu: "100m"
          memory: "64Mi"
EOF
```

```bash
kubectl apply -f manifests/oom-demo-pod.yaml
```

```bash
kubectl get pod oom-demo -n quota-lab -w
```

Setelah reason `OOMKilled` muncul, tekan `CTRL+C`, lalu ambil status container terakhir:

```bash
kubectl get pod oom-demo -n quota-lab -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}'
```

```bash
echo
```

```bash
kubectl describe pod oom-demo -n quota-lab
```

Simpan hasilnya untuk verifikasi. Jika masih kosong, tunggu beberapa detik dan ulangi command berikut:

```bash
kubectl get pod oom-demo -n quota-lab -o jsonpath='{.status.containerStatuses[0].lastState.terminated.reason}' > /tmp/answer-oom-reason
```

```bash
cat /tmp/answer-oom-reason
```

Klik **Check** setelah file berisi `OOMKilled`.
