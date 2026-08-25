# Step 3 - Cek Control Plane dan Hostname

Di langkah ini, kamu akan menentukan:

1. Jumlah node control-plane.
2. Hostname node control-plane.

## 1. Cek role node

```bash
kubectl get nodes
```

Perhatikan kolom ROLES. Node dengan role control-plane adalah node master.

## 2. Alternatif filter dengan label

```bash
kubectl get nodes -l node-role.kubernetes.io/control-plane
```

Pada cluster lama, label bisa memakai master:

```bash
kubectl get nodes -l node-role.kubernetes.io/master
```

## 3. Simpan jawaban

Contoh jika control-plane hanya satu dan hostnamenya controlplane:

```bash
echo "1" > /tmp/answer-master-count
echo "controlplane" > /tmp/answer-master-hostname
```

Jika control-plane lebih dari satu, tulis hostname dalam satu baris dipisahkan koma tanpa spasi.

Lab selesai. Kamu sudah mengenali data dasar cluster Minikube yang penting untuk operasi Kubernetes.
