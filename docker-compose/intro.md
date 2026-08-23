# Docker Compose

Selamat datang di lab terakhir. Sampai tahap ini kita sudah menjalankan container satu per satu. Sekarang kita naik level ke skenario aplikasi yang terdiri dari beberapa komponen sekaligus, yaitu WordPress dan MariaDB.

Kalau dijalankan manual, command jadi panjang dan rawan typo. Karena itu, di lab ini kita pindahkan semuanya ke satu file konfigurasi bernama `docker-compose.yml` agar lebih rapi dan mudah diulang.

## Tujuan Lab

Setelah menyelesaikan lab ini, kamu akan bisa:

- Menjalankan WordPress + Database secara manual sebagai pembanding
- Menulis file `docker-compose.yml` untuk dua service
- Menyalakan semua service dengan satu perintah
- Melihat status, log, serta menghentikan stack aplikasi

## Alur Singkat

```text
Manual run multi-container
          ->
Tulis docker-compose.yml
          ->
docker-compose up -d
          ->
Cek status dan log
          ->
docker-compose down
```

Lanjutkan dari Step 1 sampai Step 4.
