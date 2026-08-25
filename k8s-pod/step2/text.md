# Step 2 - Inspect status Pod yang gagal dibuat

Pada langkah ini, kamu akan membuat Pod yang sengaja dibuat gagal.

Tujuannya adalah agar kamu belajar melakukan troubleshooting ketika Pod tidak berhasil berjalan.

Buat Pod dengan image yang salah:

```bash
kubectl run broken-pod --image=nginx-salah:tidak-ada
```

Setelah itu, cek status Pod:

```bash
kubectl get pods
```

Pod kemungkinan akan berada pada status seperti:

- `ContainerCreating`
- `ErrImagePull`
- `ImagePullBackOff`

Status tersebut menunjukkan bahwa Kubernetes gagal mengambil image container.

Untuk melihat detail penyebab error, gunakan command:

```bash
kubectl describe pod broken-pod
```

Perhatikan bagian bawah output pada bagian `Events`.

Biasanya akan terlihat pesan error seperti:

- `Failed to pull image`
- `pull access denied`
- `repository does not exist`

Sekarang simpan hasil status Pod ke file berikut:

```bash
kubectl get pod broken-pod -o jsonpath='{.status.containerStatuses[0].state.waiting.reason}' > /tmp/answer-broken-pod-status
```

Setelah itu klik **Check**.
