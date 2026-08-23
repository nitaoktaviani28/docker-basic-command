# Step 4 - Menjalankan Image

Sebelum selesai, kita verifikasi image lokal dan image dari Docker Hub.

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

Hapus tag image Docker Hub (opsional, untuk simulasi pull ulang):

```bash
docker rmi USERNAME/hello-nginx:v1
```

Pull dari Docker Hub:

```bash
docker pull USERNAME/hello-nginx:v1
```

Run image hasil pull:

```bash
docker run -d --name hello-nginx-hub -p 8081:80 USERNAME/hello-nginx:v1
```

Uji aplikasi:

```bash
curl localhost:8081
```

Jika berhasil, output tetap:

```text
Hello from Docker Hub!
```

Ganti `USERNAME` dengan username Docker Hub milikmu.
