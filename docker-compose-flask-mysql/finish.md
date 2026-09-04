# Lab Selesai

Selamat, kamu telah menyelesaikan lab **Docker Compose - Flask dan MySQL**.

Kamu sudah membuat aplikasi Flask, membangun image memakai Dockerfile, menjalankan Flask dan MySQL bersama Docker Compose, serta membuktikan peran bridge network dan named volume.

Konsep utama yang perlu diingat:

1. Service `app` mengakses database dengan hostname `mysql`, bukan IP container.
2. Port mapping `5000:5000` membuka Flask ke host, sedangkan MySQL tetap hanya tersedia di internal network Compose.
3. Named volume menjaga data MySQL tetap ada setelah `docker compose down`.

Cleanup seluruh resource, termasuk volume data:

```bash
cd ~/simple-python-app
```

```bash
docker compose down -v
```
