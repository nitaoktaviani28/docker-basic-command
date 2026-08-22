# Docker Basic Command - Step 1

Pada lab ini, kamu akan mempraktikkan command dasar Docker menggunakan image Nginx.

Kita akan mempelajari cara:
- Pull image Docker
- Menggunakan image dengan tag
- Menjalankan container dengan dan tanpa nama
- Menjalankan container di foreground dan background
- Melihat container serta log
- Menghentikan, menjalankan ulang, dan menghapus container
- Menghapus image

Seluruh command dijalankan langsung dari terminal.

---

## 1. Pull Docker Image Nginx

### Command
```bash
docker pull nginx
```

### Tujuan
Mengunduh image Nginx dari Docker Registry ke local Docker environment.

Pada command di atas, kita hanya menuliskan `nginx` tanpa tag.
Jika tag tidak ditentukan, Docker otomatis menggunakan tag `latest`.

Sehingga command berikut setara:

```bash
docker pull nginx
docker pull nginx:latest
```

### Verifikasi
```bash
docker images
```

Pastikan image `nginx` muncul pada daftar dan perhatikan kolom `TAG`.

## 2. Pull Image dengan Tag

### Command
```bash
docker pull nginx:alpine
```

### Tujuan
Docker image dapat memiliki beberapa versi/varian yang disebut tag.

Format image:

```bash
<image-name>:<tag>
```

Contoh:
- `nginx:latest`
- `nginx:alpine`

### Verifikasi
```bash
docker images
```

Pastikan ada lebih dari satu varian Nginx, misalnya `latest` dan `alpine`.

## 3. Menjalankan Container Tanpa Menentukan Nama

### Command
```bash
docker run -d nginx
```

### Tujuan
Membuat dan menjalankan container dari image Nginx di background.

Keterangan:
- `docker run`: membuat dan menjalankan container baru.
- `-d`: menjalankan container di background (detached mode).
- `nginx`: image yang digunakan.

Karena tidak memakai `--name`, Docker akan membuat nama container secara otomatis (random).

### Verifikasi
```bash
docker ps
```

Perhatikan kolom `NAMES`. Nama yang muncul bisa seperti `focused_turing` atau `eager_morse`.

Catatan:
- Container tanpa `--name` tetap bisa dikelola dengan `Container ID` atau nama otomatis.
- Menentukan nama sendiri biasanya lebih mudah untuk pengelolaan lanjutan.

## 4. Menghentikan dan Menghapus Container Tanpa Nama

### Command
Gunakan nama yang muncul dari `docker ps`.

Contoh:
```bash
docker stop focused_turing
docker rm focused_turing
```

Jika nama berbeda, sesuaikan dengan nama di terminal kamu.

### Verifikasi
```bash
docker ps -a
```

Pastikan container tersebut sudah tidak ada.

## 5. Menjalankan Container dengan Nama

### Command
```bash
docker run -d --name nginx-basic nginx
```

### Tujuan
Membuat dan menjalankan container Nginx di background dengan nama yang ditentukan sendiri.

Keterangan:
- `docker run`: membuat dan menjalankan container.
- `-d`: menjalankan container di background.
- `--name nginx-basic`: memberi nama container `nginx-basic`.
- `nginx`: image yang digunakan.

Dengan nama sendiri, command berikut lebih mudah dijalankan:

```bash
docker logs nginx-basic
docker stop nginx-basic
docker start nginx-basic
docker restart nginx-basic
```

### Verifikasi
```bash
docker ps
```

Pastikan kolom `NAMES` menampilkan `nginx-basic`.

## 6. Memahami Mode Background (`-d`)

### Command
```bash
docker run -d --name nginx-background nginx
```

### Tujuan
`-d` adalah detached mode, artinya container berjalan di background dan terminal langsung kembali ke prompt.

### Verifikasi
```bash
docker ps
```

Pastikan container berstatus `Up`.

Catatan:
Pada tahap ini ada dua container: `nginx-basic` dan `nginx-background`.

Cleanup sebelum lanjut:
```bash
docker stop nginx-basic nginx-background
docker rm nginx-basic nginx-background
```

Verifikasi cleanup:
```bash
docker ps -a
```

## 7. Menjalankan Container Tanpa `-d` (Foreground)

### Command
```bash
docker run --name nginx-foreground nginx
```

### Tujuan
Tanpa `-d`, container berjalan di foreground. Terminal tetap terhubung ke proses container dan output tampil langsung.

Berbeda dengan command berikut yang berjalan di background:

```bash
docker run -d nginx
```

Saat berjalan di foreground, prompt terminal tidak langsung kembali.

Menghentikan proses foreground:
- Tekan `Ctrl + C`.

Setelah berhenti, container masih ada (status `Exited`).

### Verifikasi
```bash
docker ps -a
```

Kamu masih bisa menjalankan ulang container:

```bash
docker start nginx-foreground
```

Cleanup:
```bash
docker rm nginx-foreground
```

## 8. Membandingkan Foreground dan Background

Foreground:
```bash
docker run --name nginx-foreground nginx
```
- Terminal terikat dengan proses container.
- Prompt tidak langsung kembali.
- Hentikan dengan `Ctrl + C`.

Background:
```bash
docker run -d --name nginx-background nginx
```
- Container berjalan di background.
- Prompt terminal langsung kembali.
- Container tetap berjalan.

## 9. Menjalankan Nginx di Background dengan Nama

### Command
```bash
docker run -d --name nginx-basic nginx
```

### Tujuan
Membuat container Nginx yang:
- Menggunakan image `nginx`
- Memiliki nama `nginx-basic`
- Berjalan di background

Container ini digunakan untuk langkah-langkah berikutnya.

### Verifikasi
```bash
docker ps
```

Pastikan `nginx-basic` berstatus `Up`.

## 10. Menjalankan Command di Dalam Container

### Command
```bash
docker exec nginx-basic nginx -v
```

### Tujuan
Menjalankan command di dalam container yang sedang berjalan.

Keterangan:
- `docker exec`: menjalankan command di dalam container.
- `nginx-basic`: nama container target.
- `nginx -v`: menampilkan versi Nginx.

## 11. Masuk ke Interactive Terminal Container

### Command
```bash
docker exec -it nginx-basic /bin/bash
```

### Tujuan
Membuka terminal interaktif di dalam container.

Setelah masuk, jalankan:
```bash
hostname
nginx -v
```

Keluar dari container:
```bash
exit
```

## 12. Melihat Container yang Berjalan

### Command
```bash
docker ps
```

### Tujuan
Menampilkan container yang sedang berjalan.
Pastikan `nginx-basic` masih berstatus `Up`.

## 13. Melihat Semua Container

### Command
```bash
docker ps -a
```

### Tujuan
Menampilkan seluruh container, baik running maupun stopped.

Perbedaan:
- `docker ps`: hanya container yang berjalan.
- `docker ps -a`: semua container.

## 14. Melihat Logs Container

### Command
```bash
docker logs nginx-basic
```

### Tujuan
Melihat log dari container untuk monitoring dan troubleshooting.

100 baris log terakhir:
```bash
docker logs -n 100 nginx-basic
```

## 15. Menghentikan Container

### Command
```bash
docker stop nginx-basic
```

### Tujuan
Menghentikan container yang sedang berjalan.
Container tidak langsung terhapus.

### Verifikasi
```bash
docker ps -a
```

Pastikan status `nginx-basic` adalah `Exited`.

## 16. Menjalankan Kembali Container

### Command
```bash
docker start nginx-basic
```

### Tujuan
Menjalankan kembali container yang sudah ada.

Catatan:
- `docker start` tidak membuat container baru.

### Verifikasi
```bash
docker ps
```

Pastikan status kembali `Up`.

## 17. Restart Container

### Command
```bash
docker restart nginx-basic
```

### Tujuan
Melakukan stop lalu start dalam satu command.

### Verifikasi
```bash
docker ps
```

Pastikan container kembali berstatus `Up`.

## 18. Menjalankan Command Saat Membuat Container

### Command
```bash
docker run nginx nginx -v
```

### Tujuan
Menjalankan command tertentu saat container dibuat.

Pada contoh di atas:
- `nginx` pertama adalah image yang dipakai.
- `nginx -v` adalah command yang dijalankan di container.

Setelah command selesai, container bisa berhenti karena proses utamanya selesai.

## 19. Menghapus Container

### Command
```bash
docker stop nginx-basic
docker rm nginx-basic
```

### Tujuan
Menghentikan lalu menghapus container.

Catatan:
- Menghapus container tidak menghapus image.

### Verifikasi
```bash
docker ps -a
```

Pastikan `nginx-basic` sudah tidak muncul.

## 20. Melihat Docker Image

### Command
```bash
docker images
```

### Tujuan
Menampilkan image yang tersimpan di local Docker environment.

Walaupun container sudah dihapus, image Nginx masih tersedia.
Ini menunjukkan bahwa image dan container adalah entitas yang berbeda.

## 21. Menghapus Docker Image

### Command
```bash
docker rmi nginx:alpine
docker rmi nginx:latest
```

Jika hanya tersisa satu tag, kamu juga bisa menggunakan:

```bash
docker rmi nginx
```

### Tujuan
Menghapus image Nginx dari local Docker environment.

### Verifikasi
```bash
docker images
```

Pastikan image Nginx yang digunakan pada lab ini sudah tidak tersedia.

## Lab Selesai

Selamat, kamu telah menyelesaikan praktik Docker Basic Command.

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