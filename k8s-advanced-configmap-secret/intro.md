# Kubernetes Advanced - Lab 2: ConfigMap and Secret

Selamat datang di lab kedua seri **Kubernetes Advanced**.

Di lab ini kamu akan mengenal dua resource penting untuk menyimpan konfigurasi aplikasi:

1. **ConfigMap** untuk konfigurasi non-sensitif, misalnya `APP_NAME`, `APP_ENV`, atau `LOG_LEVEL`.
2. **Secret** untuk data yang perlu dibatasi aksesnya, misalnya username database, password, API key, atau token.

Kubernetes menyimpan nilai pada Secret dalam format Base64. Perlu diingat, Base64 bukan enkripsi. Karena itu Secret tetap harus dilindungi dengan RBAC dan praktik keamanan yang baik.

Kamu akan membuat ConfigMap dan Secret melalui command, file `.env`, serta YAML. Pada bagian akhir, keduanya dipakai sebagai environment variable di dalam Deployment.

Klik **Start** untuk memulai.
