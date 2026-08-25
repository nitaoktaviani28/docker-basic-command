# Step 3 - Cek Jumlah Master dan Hostname Master

Pada langkah ini, kamu diminta untuk mengecek:

1. Berapa jumlah node master atau control-plane pada cluster.
2. Apa hostname dari node master atau control-plane tersebut.

Di Kubernetes versi baru, node master biasanya menggunakan label:

```text
node-role.kubernetes.io/control-plane
```

Sedangkan pada beberapa cluster lama, label yang digunakan adalah:

```text
node-role.kubernetes.io/master
```

Jalankan command berikut untuk melihat node yang berperan sebagai master atau control-plane:

```bash
kubectl get nodes
```

Perhatikan kolom `ROLES`.

Contoh output:

```text
NAME           STATUS   ROLES           AGE   VERSION
controlplane   Ready    control-plane   20m   v1.30.0
node01         Ready    <none>          20m   v1.30.0
```

Dari contoh di atas:

- Jumlah master atau control-plane: `1`
- Hostname master atau control-plane: `controlplane`

Kamu juga dapat menggunakan command berikut untuk menampilkan hostname master atau control-plane berdasarkan label:

```bash
kubectl get nodes -l node-role.kubernetes.io/control-plane
```

Sekarang simpan jawaban kamu ke file berikut:

```bash
echo "1" > /tmp/answer-master-count
echo "controlplane" > /tmp/answer-master-hostname
```

Ganti value di atas sesuai dengan hasil pada cluster kamu.

Jika terdapat lebih dari satu master, tulis hostname master dalam satu baris, dipisahkan dengan koma tanpa spasi.

Lab selesai. Kamu sudah mempraktikkan cara mengenali informasi dasar cluster Kubernetes yang penting untuk administrasi dan troubleshooting.
