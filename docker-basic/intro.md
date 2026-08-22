# Docker Basic Command

## Tujuan

Pada lab ini, kita akan mempraktikkan command dasar Docker menggunakan image **Nginx**.

## Alur Lab (Step by Step)

### Step 1 - Image Dasar
- Pull image Nginx (`latest`).
- Pull image Nginx dengan tag (`alpine`).
- Menjalankan container tanpa nama.

### Step 2 - Nama dan Mode Container
- Menjalankan container dengan nama (`nginx-basic`).
- Menjalankan container di background (`-d`).
- Menjalankan container di foreground (tanpa `-d`).

### Step 3 - Interaksi Container
- Melihat daftar container (`docker ps`, `docker ps -a`).
- Menjalankan command di dalam container (`docker exec`).
- Masuk ke terminal interaktif container (`docker exec -it`).
- Melihat log container (`docker logs`).

### Step 4 - Lifecycle Container
- Stop container (`docker stop`).
- Start container (`docker start`).
- Restart container (`docker restart`).
- Menjalankan command saat membuat container.
- Hapus container (`docker rm`).

### Step 5 - Cleanup Image
- Melihat daftar image (`docker images`).
- Menghapus image (`docker rmi`).

Klik **Start** untuk masuk ke **Step 1**, lalu lanjutkan ke step berikutnya sampai selesai.