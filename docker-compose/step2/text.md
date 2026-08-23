# Step 2 - Menulis docker-compose.yml

Sekarang kita ubah command manual tadi menjadi konfigurasi terstruktur.

Buat file `docker-compose.yml`:

```bash
cat <<EOF> docker-compose.yml
services:
  db:
    image: mariadb:10.11
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wpuser
      MYSQL_PASSWORD: wppassword
    volumes:
      - db_data:/var/lib/mysql

  wordpress:
    image: wordpress:latest
    restart: always
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wpuser
      WORDPRESS_DB_PASSWORD: wppassword
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wp_data:/var/www/html

volumes:
  db_data:
  wp_data:
EOF
```

## Ringkasan keyword penting

- `services`: daftar container yang dikelola Compose.
- `db` dan `wordpress`: nama service, sekaligus hostname internal pada network default Compose.
- `image`: image dan tag yang dipakai.
- `restart`: kebijakan restart otomatis.
- `environment`: variabel konfigurasi untuk aplikasi.
- `ports`: mapping port host ke port container.
- `volumes` (service): mount volume ke path dalam container.
- `volumes` (root): deklarasi named volume yang dikelola Docker.
