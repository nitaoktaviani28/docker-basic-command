# Step 8 - Pull Image dari Docker Hub

Sekarang kita simulasikan menggunakan image yang tersedia di registry.

Hapus image lokal:

```bash
docker rmi USERNAME/hello-nginx:v1
```

Kemudian download kembali dari Docker Hub:

```bash
docker pull USERNAME/hello-nginx:v1
```

Periksa:

```bash
docker images
```

Image sekarang kembali tersedia di local environment.
