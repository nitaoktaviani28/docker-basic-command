# Step 2 - Build Docker Image

Sekarang kita akan membuat Docker Image berdasarkan Dockerfile.

Jalankan:

```bash
docker build -t hello-nginx:v1 .
```

## Penjelasan

```text
docker build
```

Digunakan untuk membuat Docker Image.

```text
-t hello-nginx:v1
```

Memberikan nama dan tag pada image.

```text
.
```

Menunjukkan bahwa Dockerfile berada di directory saat ini.
