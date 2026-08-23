# Step 4 - Menjalankan Image

Sebelum selesai, kita verifikasi image lokal dan image dari Docker Hub.

Pastikan variabel username sudah ada (jika terminal baru):

```bash
export DOCKERHUB_USER="USERNAME_KAMU"
```

## A. Uji image lokal

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

## B. Pull lalu jalankan dari Docker Hub

Hapus image lama dulu agar pull benar-benar mengambil versi terbaru (opsional):

```bash
docker rmi $DOCKERHUB_USER/hello-nginx:v1 hello-nginx:v1 2>/dev/null || true
```

Pull dari Docker Hub:

```bash
docker pull $DOCKERHUB_USER/hello-nginx:v1
```

Run image hasil pull:

```bash
docker run -d --name hello-nginx-hub -p 8081:80 $DOCKERHUB_USER/hello-nginx:v1
```

Uji aplikasi:

```bash
curl localhost:8081
```

Jika berhasil, output tetap:

```text
Hello from Docker Hub!
```

Jika sebelumnya kamu sudah pull image seperti `haechanlovelove/hello-nginx:v1`, maka command run juga harus pakai nama yang sama persis.
