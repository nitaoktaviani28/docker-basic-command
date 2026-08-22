# Docker Networking - Step 2

## Host Network

Pada mode `host`, container memakai network host secara langsung.

### Bersihkan Container Sebelumnya

```bash
docker stop nginx-bridge
docker rm nginx-bridge
```

### Jalankan Nginx

```bash
docker run -d --name nginx-host --network host nginx
```

### Tujuan

Menjalankan Nginx dengan network `host` tanpa port mapping `-p`.

### Cek Container

```bash
docker ps
```

Pastikan `nginx-host` berstatus `Up`.

### Akses Nginx

```bash
curl http://localhost:80
```

Jika berhasil, halaman default Nginx akan muncul.

### Konsep Utama

Pada mode `host`:

```text
Host: 80 -> Nginx Container
```

Catatan:
- Mode `host` bekerja sesuai perilaku Linux.
- Di Docker Desktop (Windows/Mac), implementasi bisa berbeda dari Linux native.

Lanjutkan ke **Next** untuk mencoba mode `none`.
