# Docker Basic Command - Step 1

Pada tahap ini, kamu akan fokus ke dasar image dan container awal.

## 1. Pull Docker Image Nginx

### Command
```bash
docker pull nginx
```

### Tujuan
Mengunduh image Nginx dari Docker Registry ke local Docker environment.

Jika tag tidak ditentukan, Docker otomatis menggunakan tag `latest`.

Command berikut setara:

```bash
docker pull nginx
docker pull nginx:latest
```

### Verifikasi
```bash
docker images
```

## 2. Pull Image dengan Tag

### Command
```bash
docker pull nginx:alpine
```

### Tujuan
Mengunduh varian image Nginx berdasarkan tag.

Format:

```bash
<image-name>:<tag>
```

### Verifikasi
```bash
docker images
```

Pastikan terdapat `nginx:latest` dan `nginx:alpine`.

## 3. Menjalankan Container Tanpa Menentukan Nama

### Command
```bash
docker run -d nginx
```

### Tujuan
Menjalankan container di background tanpa `--name`, sehingga Docker akan memberi nama otomatis (random).

### Verifikasi
```bash
docker ps
```

## 4. Menghentikan dan Menghapus Container Tanpa Nama

### Command
Gunakan nama yang muncul dari `docker ps`.

Contoh:
```bash
docker stop focused_turing
docker rm focused_turing
```

### Verifikasi
```bash
docker ps -a
```

Lanjutkan ke **Next** untuk tahap berikutnya.