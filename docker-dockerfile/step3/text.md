# Step 3 - Build Docker Image

Dockerfile yang sudah dibuat sekarang digunakan untuk menghasilkan Docker Image.

Jalankan:

```bash
docker build -t flask-hello:v1 .
```

## Penjelasan

- `docker build`: membuat image berdasarkan Dockerfile.
- `-t flask-hello:v1`: memberi nama image `flask-hello` dengan tag `v1`.
- `.`: build context direktori saat ini.

## Verifikasi Image

Setelah build selesai, cek daftar image:

```bash
docker images
```

Pastikan terdapat image `flask-hello` dengan tag `v1`.
