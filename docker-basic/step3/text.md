# Docker Basic Command - Step 3

Pada tahap ini, kamu akan belajar interaksi dan observasi container.

## 9. Menjalankan Command di Dalam Container

### Command
```bash
docker exec nginx-basic nginx -v
```

### Tujuan
Menjalankan command di dalam container yang sedang berjalan.

## 10. Masuk ke Interactive Terminal Container

### Command
```bash
docker exec -it nginx-basic /bin/bash
```

### Tujuan
Membuka terminal interaktif di dalam container.

Coba jalankan:
```bash
hostname
nginx -v
```

Keluar dari container:
```bash
exit
```

## 11. Melihat Container yang Berjalan

### Command
```bash
docker ps
```

### Tujuan
Menampilkan container yang sedang berjalan.

## 12. Melihat Semua Container

### Command
```bash
docker ps -a
```

### Tujuan
Menampilkan seluruh container, baik running maupun stopped.

## 13. Melihat Logs Container

### Command
```bash
docker logs nginx-basic
```

100 baris log terakhir:
```bash
docker logs -n 100 nginx-basic
```

Lanjutkan ke **Next** untuk tahap berikutnya.
