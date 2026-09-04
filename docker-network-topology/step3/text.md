# None: WordPress Tidak Dapat Menjangkau MySQL

Mode `none` tidak memberi container interface jaringan selain loopback (`lo`). Sekarang kita akan menjalankan WordPress dan MySQL dengan mode ini untuk membuktikan bahwa keduanya tidak dapat berkomunikasi.

Jalankan MySQL dengan network `none`:

```bash
docker run -d \
  --name none-mysql \
  --network none \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wordpress \
  -e MYSQL_PASSWORD=wordpresspass \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  mysql:8.0
```

Jalankan WordPress dengan network `none`. Nama database sengaja ditulis `none-mysql`, tetapi Docker DNS tidak tersedia pada mode ini.

```bash
docker run -d \
  --name none-wordpress \
  --network none \
  -e WORDPRESS_DB_HOST=none-mysql:3306 \
  -e WORDPRESS_DB_NAME=wordpress \
  -e WORDPRESS_DB_USER=wordpress \
  -e WORDPRESS_DB_PASSWORD=wordpresspass \
  wordpress:6.5-apache
```

Periksa interface pada WordPress. Hasilnya hanya `lo`; tidak akan ada `eth0`.

```bash
docker exec none-wordpress cat /proc/net/dev | tee /tmp/answer-none-interfaces
```

Uji koneksi WordPress ke MySQL. Hasil yang diharapkan adalah `blocked` karena WordPress tidak memiliki network untuk menemukan atau menghubungi `none-mysql`.

```bash
docker exec none-wordpress php -r 'mysqli_report(MYSQLI_REPORT_OFF); $db = @new mysqli("none-mysql", "wordpress", "wordpresspass", "wordpress"); if ($db->connect_errno) { echo "blocked\n"; exit(0); } echo "unexpected-success\n"; exit(1);' > /tmp/answer-none-db-connection
```

```bash
cat /tmp/answer-none-db-connection
```

Topologi None:

```text
none-wordpress -X-> none-mysql:3306
```

Klik **Check** setelah hasil koneksi adalah `blocked`.

## Kapan None Digunakan?

Gunakan network `none` untuk container yang tidak boleh berkomunikasi melalui jaringan. Container hanya memiliki interface loopback dan tidak dapat mengakses host, container lain, DNS, maupun internet.

Contoh use case:

1. Menjalankan proses batch atau job pemrosesan file yang tidak membutuhkan network.
2. Pengujian keamanan untuk memastikan aplikasi tetap aman ketika tidak memiliki akses jaringan.
3. Workload sensitif yang sengaja diisolasi dari jaringan sebagai lapisan perlindungan tambahan.

Mode `none` tidak cocok untuk aplikasi web, API, atau database yang perlu menerima koneksi dari container atau client lain.
