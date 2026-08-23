# Step 3 - Orkestrasi dengan Docker Compose

Sekarang seluruh stack bisa dijalankan dengan command singkat.

## 1. Jalankan semua service

```bash
docker-compose up -d
```

`-d` artinya berjalan di background.

## 2. Cek status service

```bash
docker-compose ps
```

## 3. Lihat log jika ada masalah

```bash
docker-compose logs -f db
```

Tekan `Ctrl+C` untuk keluar dari mode follow log.

## 4. Verifikasi akses WordPress

```bash
curl -I localhost:8080
```

Atau buka port `8080` dari menu Traffic/Ports di environment lab.

Catatan: di lab ini kita konsisten memakai format command `docker-compose`.
