# Docker Basic Command - Step 4

Pada tahap ini, kamu akan belajar lifecycle container.

## 14. Menghentikan Container

### Command
```bash
docker stop nginx-basic
```

### Verifikasi
```bash
docker ps -a
```

## 15. Menjalankan Kembali Container

### Command
```bash
docker start nginx-basic
```

### Verifikasi
```bash
docker ps
```

## 16. Restart Container

### Command
```bash
docker restart nginx-basic
```

### Verifikasi
```bash
docker ps
```

## 17. Menjalankan Command Saat Membuat Container

### Command
```bash
docker run nginx nginx -v
```

### Tujuan
Menjalankan command tertentu saat container dibuat.

## 18. Menghapus Container

### Command
```bash
docker stop nginx-basic
docker rm nginx-basic
```

### Verifikasi
```bash
docker ps -a
```

Lanjutkan ke **Next** untuk tahap terakhir.
