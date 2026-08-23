# Step 1 - Simulasi Manual Multi-Container

Di step ini, kita jalankan dulu versi manual agar terasa perbedaannya saat nanti memakai Compose.

## 1. Buat network

```bash
docker network create wp-network
```

## 2. Buat volume untuk data persisten

```bash
docker volume create db_data
docker volume create wp_data
```

## 3. Jalankan MariaDB

```bash
docker run -d --name db --restart always --network wp-network \
  --env MYSQL_ROOT_PASSWORD=rootpassword \
  --env MYSQL_DATABASE=wordpress \
  --env MYSQL_USER=wpuser \
  --env MYSQL_PASSWORD=wppassword \
  -v db_data:/var/lib/mysql \
  mariadb:10.11
```

## 4. Jalankan WordPress

```bash
docker run -d --name wordpress --restart always --network wp-network \
  -p 8080:80 \
  -e WORDPRESS_DB_HOST=db:3306 \
  -e WORDPRESS_DB_USER=wpuser \
  -e WORDPRESS_DB_PASSWORD=wppassword \
  -e WORDPRESS_DB_NAME=wordpress \
  -v wp_data:/var/www/html \
  wordpress:latest
```

## 5. Verifikasi

```bash
docker ps
curl -I localhost:8080
```

## 6. Bersihkan resource manual

```bash
docker rm -f wordpress db
docker network rm wp-network
```

Volume `db_data` dan `wp_data` tidak perlu dihapus karena akan dipakai lagi.
