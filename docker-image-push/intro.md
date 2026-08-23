# Lab - Build & Push Docker Image

Pada lab ini, kita akan membuat Docker Image sederhana menggunakan Dockerfile, kemudian mengupload image tersebut ke Docker Hub.

Alur lab:

```text
Dockerfile
    ->
docker build
    ->
Docker Image
    ->
docker login
    ->
docker tag
    ->
docker push
    ->
Docker Hub
```

## Tujuan

Setelah menyelesaikan lab ini, kamu akan mampu:

- Membuat Dockerfile sederhana
- Membuat Docker Image menggunakan `docker build`
- Login ke Docker Hub
- Memberikan tag pada image
- Push image ke Docker Hub
- Pull kembali image dari Docker Hub
- Menjalankan image yang sudah di-push

---

# Step 1 - Membuat Dockerfile

Pertama, kita akan membuat aplikasi web sederhana menggunakan Nginx.

Jalankan:

```bash
cat <<EOF > Dockerfile
FROM nginx:alpine

RUN echo "Hello from Docker Hub!" > /usr/share/nginx/html/index.html
EOF
```

Lihat isi Dockerfile:

```bash
cat Dockerfile
```

Dockerfile tersebut memiliki dua instruksi.

### FROM

```dockerfile
FROM nginx:alpine
```

Menggunakan image `nginx:alpine` sebagai dasar image kita.

### RUN

```dockerfile
RUN echo "Hello from Docker Hub!" > /usr/share/nginx/html/index.html
```

Membuat halaman HTML sederhana di dalam image.

---

# Step 2 - Build Docker Image

Sekarang kita akan membuat Docker Image berdasarkan Dockerfile.

Jalankan:

```bash
docker build -t hello-nginx:v1 .
```

### Penjelasan

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

---

# Step 3 - Melihat Image

Periksa image yang sudah dibuat:

```bash
docker images
```

Pastikan terdapat:

```text
hello-nginx
```

dengan tag:

```text
v1
```

---

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

---

# Step 5 - Login ke Docker Hub

Sekarang kita akan mengupload image ke Docker Hub.

Login menggunakan akun Docker Hub kamu:

```bash
docker login
```

Ikuti instruksi yang muncul pada terminal.

> Gunakan Docker Hub username dan credential milikmu sendiri.
>
> Jangan menuliskan password atau access token ke dalam Dockerfile maupun repository GitHub.

Jika berhasil, akan muncul pesan login berhasil.

---

# Step 6 - Memberikan Tag untuk Docker Hub

Image kita saat ini bernama:

```text
hello-nginx:v1
```

Agar dapat di-push ke Docker Hub, image perlu diberi nama sesuai repository Docker Hub.

Format:

```text
USERNAME/REPOSITORY:TAG
```

Contoh:

```text
nita123/hello-nginx:v1
```

Gunakan username Docker Hub milikmu:

```bash
docker tag hello-nginx:v1 USERNAME/hello-nginx:v1
```

Contoh:

```bash
docker tag hello-nginx:v1 nita123/hello-nginx:v1
```

Periksa kembali:

```bash
docker images
```

Sekarang seharusnya terdapat dua nama yang menunjuk ke image yang sama:

```text
hello-nginx:v1

USERNAME/hello-nginx:v1
```

---

# Step 7 - Push Image ke Docker Hub

Sekarang kita upload image ke Docker Hub.

Jalankan:

```bash
docker push USERNAME/hello-nginx:v1
```

Contoh:

```bash
docker push nita123/hello-nginx:v1
```

Docker akan mengupload layer image ke Docker Hub.

Jika berhasil, image sudah tersimpan di repository Docker Hub milikmu.

---

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

---

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

---

# Kesimpulan

Pada lab ini kita sudah melakukan seluruh proses dasar distribusi Docker Image:

```text
                 LOCAL
                   |
              Dockerfile
                   |
                   v
              docker build
                   |
                   v
             Docker Image
                   |
              docker tag
                   |
              docker login
                   |
              docker push
                   |
                   v
             DOCKER HUB
                   |
              docker pull
                   |
                   v
             Docker Image
                   |
              docker run
                   |
                   v
               Container
```

## Command yang Dipelajari

```bash
docker build
docker images
docker run
docker login
docker tag
docker push
docker rmi
docker pull
docker ps
```

## Lab Selesai

Kamu sudah berhasil membuat Docker Image dan menguploadnya ke Docker Hub.

### Hal penting

Di bagian:

```bash
docker tag hello-nginx:v1 USERNAME/hello-nginx:v1
```

dan:

```bash
docker push USERNAME/hello-nginx:v1
```

peserta harus mengganti `USERNAME` dengan username Docker Hub mereka sendiri.

Misalnya username mereka `nita123`:

```bash
docker tag hello-nginx:v1 nita123/hello-nginx:v1
docker push nita123/hello-nginx:v1
```

Jadi setiap peserta bisa push ke repository Docker Hub masing-masing, tanpa credential kamu ikut tersimpan di Killercoda.
