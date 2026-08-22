# Docker Networking - Step 5

## Cleanup

Setelah lab selesai, hentikan dan hapus container yang dipakai.

```bash
docker stop nginx-none
docker rm nginx-none
```

Jika container masih berjalan dan ingin hapus paksa:

```bash
docker rm -f nginx-none
```

### Verifikasi

```bash
docker ps -a
```

Pastikan container untuk lab networking sudah tidak berjalan.

## Lab Selesai

Kamu sudah mencoba tiga mode network Docker:

- `bridge`
- `host`
- `none`

Perbedaan utama ketiganya ada pada cara container terhubung ke jaringan host dan jaringan eksternal.
