# Docker Networking - Step 4

## Perbedaan Bridge, Host, dan None

### Bridge

```bash
docker run -d --name nginx-bridge --network bridge -p 8080:80 nginx
```

- Container punya network sendiri.
- Perlu port mapping agar bisa diakses dari host.
- Contoh alur: `Host:8080 -> Container:80`.

### Host

```bash
docker run -d --name nginx-host --network host nginx
```

- Container memakai network host secara langsung.
- Umumnya tidak perlu `-p`.
- Contoh alur: `Host:80 -> Nginx`.

### None

```bash
docker run -d --name nginx-none --network none nginx
```

- Container tidak punya koneksi network eksternal.
- Cocok untuk proses yang tidak membutuhkan network.

### Cara Cepat Mengingat

- `bridge`: container punya network sendiri.
- `host`: container ikut network host.
- `none`: container tanpa network eksternal.

Lanjutkan ke **Next** untuk cleanup dan penutup.
