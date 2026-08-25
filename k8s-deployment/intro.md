# K8s - Deployment

Selamat datang di **Lab 3 - Deployment**.

Pada lab sebelumnya, kamu sudah belajar tentang **Pod** sebagai unit terkecil di Kubernetes. Di lab ini, kita akan naik satu level ke resource yang jauh lebih sering dipakai di environment production, yaitu **Deployment**.

Deployment digunakan untuk mengelola Pod secara deklaratif. Dengan Deployment, Kubernetes dapat:

1. Membuat Pod berdasarkan jumlah replica yang ditentukan.
2. Melakukan scale up dan scale down Pod.
3. Mengupdate image secara bertahap dengan rolling update.
4. Membuat ulang Pod secara otomatis jika ada Pod yang dihapus atau gagal.
5. Menjaga agar kondisi aktual cluster tetap sesuai dengan kondisi yang diinginkan.

Pada lab ini, kamu akan belajar:

1. Membuat Deployment menggunakan command `kubectl`.
2. Membuat Deployment menggunakan file YAML.
3. Melakukan scale up dan scale down replica.
4. Mengupdate image Deployment.
5. Memahami rolling update.
6. Memahami self-healing pada Deployment.
7. Memahami struktur YAML Deployment.

Klik **Start** untuk memulai lab.
