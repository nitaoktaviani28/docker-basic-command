# Lab Selesai

Selamat, kamu telah menyelesaikan **Kubernetes Advanced - Lab 3: K8s - Ingress**.

Pada lab ini kamu sudah menginstal Ingress Controller, membuat dua backend dengan Service `ClusterIP`, dan melakukan path-based routing melalui satu object Ingress.

Kamu juga sudah membuktikan bahwa host dan path menentukan backend tujuan:

```text
app.ingress.local/blue  -> Blue App
app.ingress.local/green -> Green App
```

Ingress adalah fondasi penting untuk mengekspos aplikasi web dengan URL yang lebih terstruktur. Pada lingkungan production, Ingress biasanya digabungkan dengan DNS, TLS, dan certificate manager.

Cleanup resource aplikasi:

```bash
kubectl delete namespace ingress-lab
```

Jika controller hanya dipakai untuk lab ini, hapus juga manifest ingress-nginx yang telah diterapkan.
