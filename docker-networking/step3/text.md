# Docker Networking - Step 3

## None Network

Pada mode `none`, container tidak terhubung ke network eksternal.

### Bersihkan Container Sebelumnya

```bash
docker stop nginx-host
docker rm nginx-host
```

### Jalankan Nginx

```bash
docker run -d --name nginx-none --network none nginx
```

### Tujuan

Menjalankan container tanpa akses network keluar/masuk.

### Cek Container

```bash
docker ps
```

Pastikan `nginx-none` berstatus `Up`.

### Coba Akses Nginx

```bash
curl http://localhost:80
```

Pada mode `none`, akses jaringan ke layanan Nginx tidak berjalan seperti mode `bridge` atau `host`.

### Konsep Utama

```text
Container -> Tidak terhubung ke network eksternal
```

Lanjutkan ke **Next** untuk melihat perbandingan ringkas ketiga mode.
