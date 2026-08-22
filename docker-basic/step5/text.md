# Docker Basic Command - Step 5

Pada tahap terakhir, kamu akan meninjau dan membersihkan image Docker.

## 19. Melihat Docker Image

### Command
```bash
docker images
```

### Tujuan
Menampilkan image yang tersimpan di local Docker environment.

## 20. Menghapus Docker Image

### Command
```bash
docker rmi nginx:alpine
docker rmi nginx:latest
```

Jika hanya tersisa satu tag, kamu juga bisa:

```bash
docker rmi nginx
```

### Verifikasi
```bash
docker images
```

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
