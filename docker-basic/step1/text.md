# Docker Basic Command - Step 1

Pada lab ini, kamu akan mempraktikkan command dasar Docker menggunakan image Nginx.
Seluruh command dijalankan langsung dari terminal.

## 1. Pull Docker Image

### Command
```bash
docker pull nginx
```

### Tujuan
Command ini digunakan untuk mengunduh Docker image Nginx dari Docker Registry ke environment lokal.

Verifikasi image yang berhasil diunduh:

```bash
docker images
```

Pastikan image `nginx` muncul pada daftar.

## 2. Menjalankan Container

### Command
```bash
docker run -d --name nginx-basic nginx
```

### Tujuan
Command ini membuat sekaligus menjalankan container baru dari image Nginx.

Keterangan:
- `docker run`: membuat dan menjalankan container baru.
- `-d`: menjalankan container di background (detached mode).
- `--name nginx-basic`: memberi nama container.
- `nginx`: image yang digunakan.

## 3. Melihat Container yang Berjalan

### Command
```bash
docker ps
```

### Tujuan
Menampilkan daftar container yang sedang berjalan.
Pastikan container `nginx-basic` berstatus `Up`.

## 4. Melihat Semua Container

### Command
```bash
docker ps -a
```

### Tujuan
Menampilkan semua container, baik yang berjalan maupun berhenti.

Perbedaan singkat:
- `docker ps`: hanya container yang sedang berjalan.
- `docker ps -a`: semua container.

## 5. Menjalankan Command di Dalam Container

### Command
```bash
docker exec nginx-basic nginx -v
```

### Tujuan
Menjalankan command di dalam container yang sedang berjalan.
Output akan menampilkan versi Nginx, misalnya `nginx version: nginx/...`.

## 6. Masuk ke Interactive Terminal Container

### Command
```bash
docker exec -it nginx-basic /bin/bash
```

### Tujuan
Membuka terminal interaktif ke dalam container.

Setelah masuk ke container, jalankan:

```bash
hostname
nginx -v
```

Keluar dari container:

```bash
exit
```

## 7. Menjalankan Command Saat Membuat Container

### Command
```bash
docker run nginx nginx -v
```

### Tujuan
Menjalankan command langsung saat container dibuat.

Struktur umum:

```bash
docker run <image> <command>
```

## 8. Melihat Logs Container

### Command
```bash
docker logs nginx-basic
```

### Tujuan
Menampilkan log dari container untuk monitoring dan troubleshooting.

Menampilkan 100 baris log terakhir:

```bash
docker logs -n 100 nginx-basic
```

## 9. Menghentikan Container

### Command
```bash
docker stop nginx-basic
```

### Tujuan
Menghentikan container yang sedang berjalan.

Cek status container:

```bash
docker ps -a
```

Status container akan berubah menjadi `Exited`.

## 10. Menjalankan Kembali Container

### Command
```bash
docker start nginx-basic
```

### Tujuan
Menjalankan kembali container yang sebelumnya berhenti.

Verifikasi:

```bash
docker ps
```

Pastikan status kembali `Up`.

## 11. Restart Container

### Command
```bash
docker restart nginx-basic
```

### Tujuan
Melakukan stop lalu start otomatis dalam satu command.

Verifikasi:

```bash
docker ps
```

## 12. Menghapus Container

### Command
```bash
docker stop nginx-basic
docker rm nginx-basic
```

### Tujuan
Menghentikan dan menghapus container dari environment lokal.
Menghapus container tidak menghapus image.

Verifikasi:

```bash
docker ps -a
```

## 13. Melihat Docker Image

### Command
```bash
docker images
```

### Tujuan
Menampilkan daftar image yang tersimpan secara lokal.

## 14. Menghapus Docker Image

### Command
```bash
docker rmi nginx
```

### Tujuan
Menghapus image Nginx dari environment lokal.

Verifikasi:

```bash
docker images
```

Pastikan image `nginx` sudah tidak ada.

## Lab Selesai

Selamat, kamu sudah menyelesaikan praktik Docker Basic Command.

Command yang dipraktikkan:
- `docker pull`
- `docker images`
- `docker run`
- `docker ps`
- `docker ps -a`
- `docker exec`
- `docker exec -it`
- `docker logs`
- `docker stop`
- `docker start`
- `docker restart`
- `docker rm`
- `docker rmi`