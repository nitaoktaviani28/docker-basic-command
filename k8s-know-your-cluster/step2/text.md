# Step 2 - Cek Operating System dan Versi Kubernetes

Di langkah ini, kamu akan mengecek informasi detail dari node Kubernetes, khususnya:

1. Operating System yang digunakan oleh node Kubernetes.
2. Versi Kubernetes yang digunakan oleh node.

Jalankan command berikut:

```bash
kubectl get nodes -o wide
```

Output command tersebut akan menampilkan informasi tambahan, di antaranya:

- `OS-IMAGE`
- `KERNEL-VERSION`
- `CONTAINER-RUNTIME`

Untuk mengetahui versi Kubernetes, perhatikan kolom `VERSION`.

Contoh output:

```text
NAME           STATUS   ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE            KERNEL-VERSION   CONTAINER-RUNTIME
controlplane   Ready    control-plane   10m   v1.30.0   172.30.1.2    <none>        Ubuntu 22.04.4 LTS  5.15.0-105       containerd://1.7
node01         Ready    <none>          10m   v1.30.0   172.30.1.3    <none>        Ubuntu 22.04.4 LTS  5.15.0-105       containerd://1.7
```

Dari contoh di atas, kita bisa mengetahui bahwa:

- Operating System: `Ubuntu 22.04.4 LTS`
- Versi Kubernetes: `v1.30.0`

Sekarang simpan jawaban kamu ke file berikut:

```bash
echo "Ubuntu 22.04.4 LTS" > /tmp/answer-os
echo "v1.30.0" > /tmp/answer-k8s-version
```

Ganti value di atas sesuai dengan hasil yang muncul pada cluster kamu.
