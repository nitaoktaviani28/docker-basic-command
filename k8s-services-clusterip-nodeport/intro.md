# K8s - Services: ClusterIP and NodePort

Selamat datang di **Lab 4 - Services: ClusterIP and NodePort**.

Pada lab ini, kamu akan belajar bagaimana **Service** bekerja di Kubernetes, khususnya dua tipe yang paling sering ditemui:

1. `ClusterIP`
2. `NodePort`

Service digunakan untuk memberikan alamat akses yang stabil ke Pod. Hal ini penting karena Pod bersifat dinamis: nama Pod dan IP Pod bisa berubah saat Pod dibuat ulang, tetapi Service tetap menyediakan endpoint yang konsisten.

Di lab ini, kita akan membuat dua komponen utama:

1. **MySQL** sebagai backend internal.
2. **WordPress** sebagai frontend atau client yang terhubung ke MySQL.

Alur koneksinya kurang lebih seperti ini:

```text
WordPress Pod
     |
     v
Service ClusterIP (mysql-service)
     |
     v
MySQL Pod
```

Setelah itu, WordPress akan kita publikasikan menggunakan **Service NodePort** agar bisa diakses dari luar Pod menggunakan IP node dan port tertentu.

Pada lab ini, kamu akan belajar:

1. Membuat Deployment MySQL.
2. Membuat Service `ClusterIP` untuk backend.
3. Membuat Deployment WordPress yang terhubung ke MySQL.
4. Membuat Service `NodePort` untuk WordPress.
5. Menguji akses menggunakan `curl`.

Klik **Start** untuk memulai lab.
