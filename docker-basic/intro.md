# Docker Basic Command

## Tujuan

Pada lab ini, kita akan mempraktikkan command dasar Docker menggunakan image **Nginx**.

## Alur Lab (Step by Step)

### Step 1 - Persiapan
- Mulai lab dan pastikan siap menjalankan command Docker.

### Step 2 - Image Dasar
- Pull image Nginx (`latest`).
- Pull image Nginx dengan tag (`alpine`).

### Step 3 - Container Dasar
- Menjalankan container tanpa nama.
- Menjalankan container dengan nama (`nginx-basic`).

### Step 4 - Mode Menjalankan Container
- Menjalankan container di background (`-d`).
- Menjalankan container di foreground (tanpa `-d`).

### Step 5 - Operasional Container
- Melihat daftar container (`docker ps`, `docker ps -a`).
- Menjalankan command di dalam container (`docker exec`).
- Masuk ke terminal interaktif container (`docker exec -it`).
- Melihat log container (`docker logs`).

### Step 6 - Lifecycle Container
- Stop container (`docker stop`).
- Start container (`docker start`).
- Restart container (`docker restart`).
- Hapus container (`docker rm` / `docker rm -f`).

### Step 7 - Cleanup Image
- Melihat daftar image (`docker images`).
- Menghapus image (`docker rmi`).

Klik **Start** untuk masuk ke **Step 1**, lalu lanjutkan ke step berikutnya sampai selesai.