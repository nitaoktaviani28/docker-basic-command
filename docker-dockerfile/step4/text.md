# Step 4 - Menjalankan dan Verifikasi Container

Sekarang image yang sudah dibuat akan digunakan untuk membuat container.

Jalankan:

```bash
docker run -d -p 8080:5000 --name flask-app flask-hello:v1
```

## Penjelasan

- `docker run`: membuat sekaligus menjalankan container.
- `-d`: menjalankan container di background.
- `-p 8080:5000`: memetakan port host `8080` ke port container `5000`.
- `--name flask-app`: memberi nama container.
- `flask-hello:v1`: image yang dipakai.

## Memeriksa Container

Cek status container:

```bash
docker ps
```

Pastikan `flask-app` berstatus `Up`.

## Menguji Aplikasi

Akses aplikasi dari host:

```bash
curl localhost:8080
```

Jika berhasil, akan muncul output `Hello World!`.

## Melihat Container dari Dalam

Cek hostname container:

```bash
docker exec flask-app hostname
```

Bandingkan dengan hostname host:

```bash
hostname
```

Hostname akan berbeda karena aplikasi berjalan di dalam container.
