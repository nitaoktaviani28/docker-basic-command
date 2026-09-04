# Komunikasi Antar-Container pada Bridge

Port mapping hanya dibutuhkan untuk akses dari **host** ke container. Container yang berada pada user-defined bridge yang sama dapat saling berkomunikasi langsung tanpa `-p`.

Ambil IP milik `bridge-web`:

```bash
BRIDGE_WEB_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' bridge-web)
echo "$BRIDGE_WEB_IP"
```

Buat container client sementara. Container ini melakukan request ke server menggunakan **nama container** `bridge-web`:

```bash
docker run --rm \
  --network webinar-bridge \
  curlimages/curl:8.10.1 \
  -fsS http://bridge-web > /tmp/answer-bridge-container-dns

grep -o 'Welcome to nginx!' /tmp/answer-bridge-container-dns
```

Uji juga dengan IP container. Tidak ada port `8080` di sini karena koneksi terjadi langsung ke port aplikasi `80` pada bridge network:

```bash
docker run --rm \
  --network webinar-bridge \
  curlimages/curl:8.10.1 \
  -fsS "http://${BRIDGE_WEB_IP}" > /tmp/answer-bridge-container-ip

grep -o 'Welcome to nginx!' /tmp/answer-bridge-container-ip
```

Topologinya:

```text
Container client -> webinar-bridge -> bridge-web:80
```

Perhatikan perbedaannya: `bridge-web` dapat dipakai sebagai hostname karena kedua container berada pada user-defined bridge yang sama.

Klik **Check** setelah kedua pengujian berhasil.
