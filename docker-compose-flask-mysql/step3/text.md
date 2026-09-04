# Menyimpan Nama ke MySQL

Sekarang buktikan aplikasi Flask benar-benar menulis data ke MySQL.

Kirim nama `Nita` ke aplikasi menggunakan HTTP POST. Opsi `-L` mengikuti redirect aplikasi kembali ke halaman utama.

```bash
curl -s -L -d 'name=Nita' http://127.0.0.1:5000 > /tmp/answer-app-name
```

Periksa apakah nama muncul di halaman aplikasi:

```bash
grep -o '<li>Nita</li>' /tmp/answer-app-name
```

Masuk ke MySQL melalui container dan query data yang baru ditambahkan:

```bash
docker exec simple-mysql mysql -uappuser -papppassword -D appdb -N -e "SELECT name FROM names WHERE name = 'Nita' ORDER BY id DESC LIMIT 1;" > /tmp/answer-mysql-name
```

```bash
cat /tmp/answer-mysql-name
```

Alurnya adalah:

```text
Browser atau curl -> Flask:5000 -> hostname mysql:3306 -> MySQL appdb.names
```

Klik **Check** setelah `Nita` muncul di halaman aplikasi dan hasil query MySQL.
