# Step 5 - Melihat Log dan Ringkasan

## Melihat Log Container

Gunakan:

```bash
docker logs flask-app
```

Command ini menampilkan output aplikasi yang berjalan di dalam container.

## Ringkasan

Pada lab ini kita melihat perbedaan menjalankan aplikasi manual vs menggunakan Docker.

### Tanpa Docker

```text
Python
   ↓
Virtual Environment
   ↓
Flask
   ↓
Source Code
   ↓
Run Application
```

### Dengan Docker

```text
Dockerfile
     ↓
docker build
     ↓
Docker Image
     ↓
docker run
     ↓
Container
     ↓
Aplikasi
```

Docker Image membuat aplikasi dan dependency menjadi paket yang konsisten untuk dijalankan di environment lain.

## Command yang Dipelajari

```bash
docker build
docker images
docker run
docker ps
docker exec
docker logs
```

Lab selesai.
