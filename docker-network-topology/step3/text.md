# Host Network dan IP Host

Pada mode `host`, container tidak mendapat network namespace Docker sendiri. Aplikasi di dalam container langsung memakai network stack milik host.

Karena itu, **jangan gunakan `-p`**. Port `80` Nginx akan langsung terbuka pada port `80` host.

Jalankan Nginx dengan network host:

```bash
docker run -d \
  --name host-web \
  --network host \
  nginx:1.25
```

Periksa network mode dan port mapping:

```bash
docker inspect -f '{{.HostConfig.NetworkMode}}' host-web
docker port host-web
```

`docker port host-web` tidak menampilkan mapping karena Docker tidak meneruskan port. Aplikasi memang langsung menggunakan port host.

Ambil IP host, kemudian akses Nginx melalui IP tersebut:

```bash
HOST_IP=$(hostname -I | awk '{print $1}')
echo "$HOST_IP"

curl -fsS "http://${HOST_IP}" > /tmp/answer-host-network-access
grep -o 'Welcome to nginx!' /tmp/answer-host-network-access
```

Kamu juga dapat mengaksesnya lewat loopback host:

```bash
curl -fsS http://127.0.0.1 | grep -o 'Welcome to nginx!'
```

Topologinya:

```text
Client -> Host IP:80 -> host-web (menggunakan network host)
```

Klik **Check** setelah halaman Nginx berhasil diakses melalui IP host.
