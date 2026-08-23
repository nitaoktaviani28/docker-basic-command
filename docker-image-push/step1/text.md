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

## FROM

```dockerfile
FROM nginx:alpine
```

Menggunakan image `nginx:alpine` sebagai dasar image kita.

## RUN

```dockerfile
RUN echo "Hello from Docker Hub!" > /usr/share/nginx/html/index.html
```

Membuat halaman HTML sederhana di dalam image.
