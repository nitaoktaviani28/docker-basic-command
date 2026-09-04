# Host: WordPress dan MySQL

Pada mode `host`, container berbagi network stack dengan host. Tidak ada IP container terpisah dan tidak ada port mapping Docker.

Jalankan MySQL pada host network. Port MySQL `3306` langsung menjadi port host:

```bash
docker run -d \
  --name host-mysql \
  --network host \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=wordpresspass \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  mysql:8.0
```

Tunggu MySQL siap:

```bash
until docker exec host-mysql mysqladmin ping -h 127.0.0.1 -uroot -prootpass --silent; do sleep 2; done
```

Jalankan WordPress pada host network. Database dituju melalui `127.0.0.1:3306`, karena WordPress dan MySQL sama-sama memakai network host.

```bash
docker run -d \
  --name host-wordpress \
  --network host \
  -e WORDPRESS_DB_HOST=127.0.0.1:3306 \
  -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USER=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpresspass \
  wordpress:6.5-apache
```

Periksa mode jaringan WordPress. Jangan gunakan `-p`; WordPress langsung memakai port `80` pada host.

```bash
docker inspect -f '{{.HostConfig.NetworkMode}}' host-wordpress
```

Ambil IP host:

```bash
HOST_IP=$(hostname -I | awk '{print $1}')
```

```bash
echo "$HOST_IP"
```

Akses WordPress langsung melalui IP host, tanpa `:8080` atau port mapping lain:

```bash
curl -fsSL "http://${HOST_IP}" > /tmp/answer-host-wordpress-access
```

```bash
grep -o 'WordPress' /tmp/answer-host-wordpress-access | head -n 1
```

Buktikan WordPress dapat terhubung ke MySQL melalui loopback host:

```bash
docker exec host-wordpress php -r '$db = @new mysqli("127.0.0.1", "wordpress", "wordpresspass", "wordpress"); if ($db->connect_error) { fwrite(STDERR, $db->connect_error . PHP_EOL); exit(1); } echo "connected\n"; $db->close();' > /tmp/answer-host-db-connection
```

```bash
cat /tmp/answer-host-db-connection
```

Topologi Host:

```text
Client -> Host IP:80 -> host-wordpress
host-wordpress -> 127.0.0.1:3306 -> host-mysql
```

Klik **Check** setelah WordPress dapat diakses melalui IP host dan koneksi database menampilkan `connected`.
