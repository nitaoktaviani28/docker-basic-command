# None Network dan Isolasi

Mode `none` digunakan ketika container tidak boleh memiliki koneksi jaringan. Docker hanya menyediakan interface loopback (`lo`); tidak ada `eth0`, default gateway, DNS, atau akses ke container lain.

Jalankan container Alpine dengan network `none`:

```bash
docker run -d \
  --name none-isolated \
  --network none \
  alpine:3.20 sleep 3600
```

Periksa network mode dan interface yang tersedia:

```bash
docker inspect -f '{{.HostConfig.NetworkMode}}' none-isolated
docker exec none-isolated cat /proc/net/dev | tee /tmp/answer-none-interfaces
```

Output hanya akan berisi `lo`. Tidak ada interface `eth0`.

Sekarang coba hubungkan container None ke web server Bridge menggunakan IP internalnya:

```bash
BRIDGE_WEB_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' bridge-web)

if docker exec none-isolated wget -T 3 -qO- "http://${BRIDGE_WEB_IP}"; then
  echo "unexpected-success" > /tmp/answer-none-connectivity
else
  echo "blocked" > /tmp/answer-none-connectivity
fi

cat /tmp/answer-none-connectivity
```

Hasil yang benar adalah `blocked`. Container `none-isolated` tidak dapat mengakses `bridge-web`, host, atau internet karena tidak memiliki interface jaringan.

Klik **Check** setelah hasil isolasi berhasil dibuktikan.
