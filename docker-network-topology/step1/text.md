# Bridge: WordPress dan MySQL

Pada mode `bridge`, setiap container memiliki network namespace dan IP internal sendiri. Kita akan menempatkan WordPress dan MySQL pada user-defined bridge yang sama agar keduanya dapat berkomunikasi melalui nama container.

Buat network bridge:

```bash
docker network create --driver bridge wordpress-bridge
```

Jalankan MySQL. Container ini tidak membutuhkan port mapping karena hanya akan diakses oleh WordPress dari dalam bridge network:

```bash
docker run -d \
  --name bridge-mysql \
  --network wordpress-bridge \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=wordpresspass \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  mysql:8.0
```

Tunggu MySQL selesai inisialisasi:

```bash
until docker exec bridge-mysql mysqladmin ping -h 127.0.0.1 -uroot -prootpass --silent; do sleep 2; done
```

Jalankan WordPress pada network yang sama. Gunakan `bridge-mysql:3306` sebagai host database, karena Docker DNS akan menerjemahkan nama `bridge-mysql` ke IP container MySQL.

```bash
docker run -d \
  --name bridge-wordpress \
  --network wordpress-bridge \
  -p 8080:80 \
  -e WORDPRESS_DB_HOST=bridge-mysql:3306 \
  -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USER=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpresspass \
  wordpress:6.5-apache
```

Arti `-p 8080:80` adalah `HOST_PORT:CONTAINER_PORT`: request ke port `8080` pada host akan diteruskan ke port HTTP `80` di container WordPress.

Lihat IP kedua container:

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' bridge-wordpress
```

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' bridge-mysql
```

Buktikan WordPress dapat membuka koneksi ke MySQL menggunakan hostname `bridge-mysql`:

```bash
docker exec bridge-wordpress php -r '$db = @new mysqli("bridge-mysql", "wordpress", "wordpresspass", "wordpress"); if ($db->connect_error) { fwrite(STDERR, $db->connect_error . PHP_EOL); exit(1); } echo "connected\n"; $db->close();' > /tmp/answer-bridge-db-connection
```

```bash
cat /tmp/answer-bridge-db-connection
```

Akses WordPress dari host melalui port mapping:

```bash
curl -fsSL http://127.0.0.1:8080 > /tmp/answer-bridge-wordpress-access
```

```bash
grep -o 'WordPress' /tmp/answer-bridge-wordpress-access | head -n 1
```

Topologi Bridge:

```text
Host:8080 -> bridge-wordpress:80
bridge-wordpress -> wordpress-bridge -> bridge-mysql:3306
```

Klik **Check** setelah koneksi database menampilkan `connected` dan halaman WordPress dapat diakses.

## Kapan Bridge Digunakan?

Gunakan network `bridge` untuk sebagian besar aplikasi container pada satu host, terutama ketika aplikasi perlu dipisahkan dari network host tetapi masih harus berkomunikasi dengan container lain.

Contoh use case:

1. Aplikasi web seperti WordPress terhubung ke database MySQL atau PostgreSQL.
2. Frontend, backend API, cache, dan database dalam satu environment development.
3. Aplikasi yang hanya mengekspos port tertentu ke host, misalnya WordPress pada `8080` tanpa membuka port database ke luar.

User-defined bridge seperti `wordpress-bridge` lebih disarankan daripada default bridge karena menyediakan DNS internal berdasarkan nama container.
