# Docker Networking - Step 1

## Bridge Network

`bridge` adalah mode network default Docker. Container punya network sendiri, lalu bisa diakses dari host lewat port mapping.

### Jalankan Nginx

```bash
docker run -d --name nginx-bridge --network bridge -p 8080:80 nginx
```

### Tujuan

Menjalankan Nginx pada network `bridge`.

Keterangan:
- `-d`: container berjalan di background.
- `--name nginx-bridge`: memberi nama container.
- `--network bridge`: menggunakan bridge network.
- `-p 8080:80`: host port `8080` diarahkan ke container port `80`.

### Cek Container

```bash
docker ps
```

Pastikan `nginx-bridge` berstatus `Up`.

### Akses Nginx

```bash
curl http://localhost:8080
```

Jika berhasil, akan muncul HTML default Nginx.

### Konsep Utama

Pada mode `bridge`:

```text
Host: 8080 -> Container: 80 -> Nginx
```

Lanjutkan ke **Next** untuk mencoba mode `host`.
