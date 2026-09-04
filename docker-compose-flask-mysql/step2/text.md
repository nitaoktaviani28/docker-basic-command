# Menulis dan Menjalankan Docker Compose

Docker Compose mendefinisikan dua service: `app` untuk Flask dan `mysql` untuk database. Nama service `mysql` otomatis menjadi hostname database dari dalam container app.

Pastikan masih berada di folder project:

```bash
cd ~/simple-python-app
```

Buat `docker-compose.yml`:

```bash
cat <<'EOF' > docker-compose.yml
services:
  app:
    build: .
    container_name: simple-python-app
    ports:
      - "5000:5000"
    environment:
      DB_HOST: mysql
      DB_USER: appuser
      DB_PASSWORD: apppassword
      DB_NAME: appdb
    depends_on:
      mysql:
        condition: service_healthy
    networks:
      - app-network

  mysql:
    image: mysql:8.0
    container_name: simple-mysql
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: appdb
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppassword
    healthcheck:
      test: ["CMD-SHELL", "mysqladmin ping -h localhost -uroot -p$$MYSQL_ROOT_PASSWORD"]
      interval: 5s
      timeout: 5s
      retries: 12
    volumes:
      - mysql_data:/var/lib/mysql
    networks:
      - app-network

volumes:
  mysql_data:

networks:
  app-network:
    driver: bridge
EOF
```

Validasi struktur Compose:

```bash
docker compose config
```

Build image dan jalankan seluruh service:

```bash
docker compose up -d --build
```

Periksa status container:

```bash
docker compose ps
```

Tunggu endpoint aplikasi siap, lalu simpan hasilnya:

```bash
until curl -fsS http://127.0.0.1:5000/health > /tmp/answer-compose-health; do sleep 2; done
```

```bash
cat /tmp/answer-compose-health
```

Klik **Check** setelah output menampilkan `Application is healthy`.
