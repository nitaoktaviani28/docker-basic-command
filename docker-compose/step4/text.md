# Step 4 - Shutdown dan Ringkasan

Jika pengujian selesai, hentikan seluruh stack Compose.

## 1. Matikan dan hapus container stack

```bash
docker-compose down
```

## 2. Kesimpulan praktik

- Docker command cocok untuk eksperimen cepat pada satu container.
- Docker image menjaga aplikasi tetap konsisten di berbagai environment.
- Docker Compose memudahkan menjalankan aplikasi multi-container secara berulang dan minim human error.

Dengan file `docker-compose.yml`, tim cukup memakai `docker-compose up -d` untuk menyalakan environment yang sama.

Selesai. Kamu sudah menutup seri lab Docker dari single-container sampai orkestrasi multi-container.
