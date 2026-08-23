# Step 4 - Menjalankan Image

Sebelum mengupload image, kita coba jalankan terlebih dahulu.

```bash
docker run -d --name hello-nginx -p 8080:80 hello-nginx:v1
```

Periksa container:

```bash
docker ps
```

Test aplikasi:

```bash
curl localhost:8080
```

Jika berhasil, output:

```text
Hello from Docker Hub!
```
