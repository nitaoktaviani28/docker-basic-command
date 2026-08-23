# Step 9 - Menjalankan Image dari Docker Hub

Jalankan image yang baru saja di-download:

```bash
docker run -d --name hello-nginx-hub -p 8081:80 USERNAME/hello-nginx:v1
```

Periksa container:

```bash
docker ps
```

Test:

```bash
curl localhost:8081
```

Jika berhasil:

```text
Hello from Docker Hub!
```
