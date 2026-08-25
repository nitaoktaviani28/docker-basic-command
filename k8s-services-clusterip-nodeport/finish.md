# Lab Selesai

Selamat, kamu telah menyelesaikan **Lab 4 - Services: ClusterIP and NodePort**.

Pada lab ini, kamu sudah mempelajari:

1. Cara membuat backend MySQL di Kubernetes.
2. Cara menggunakan Service `ClusterIP` untuk koneksi internal antar Pod.
3. Cara membuat WordPress yang terhubung ke backend MySQL melalui Service.
4. Cara mengekspos aplikasi menggunakan Service `NodePort`.
5. Cara menguji akses aplikasi menggunakan `curl`.

Konsep ini penting karena banyak aplikasi Kubernetes menggunakan pola yang sama: backend database diakses secara internal lewat `ClusterIP`, sedangkan frontend atau aplikasi web diekspos keluar lewat `NodePort`, `LoadBalancer`, atau `Ingress`.

Cleanup:

```bash
kubectl delete deployment mysql-backend wordpress-client
kubectl delete service mysql-service wordpress-nodeport
```

Lanjutkan ke lab berikutnya untuk memperluas pemahaman kamu tentang networking dan akses aplikasi di Kubernetes.
