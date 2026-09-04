# Memeriksa Bridge Network dan Volume

Docker Compose membuat bridge network dan named volume secara otomatis. Network memungkinkan app menemukan database melalui hostname `mysql`; volume menyimpan data database di luar lifecycle container MySQL.

Lihat network dan volume Docker:

```bash
docker network ls
```

```bash
docker volume ls
```

Ambil nama network yang dipakai aplikasi:

```bash
APP_NETWORK=$(docker inspect -f '{{range $name, $_ := .NetworkSettings.Networks}}{{$name}}{{end}}' simple-python-app)
```

```bash
echo "$APP_NETWORK"
```

Lihat anggota network tersebut. Pastikan ada `simple-python-app` dan `simple-mysql`:

```bash
docker network inspect "$APP_NETWORK" > /tmp/answer-compose-network
```

```bash
grep -o 'simple-python-app\|simple-mysql' /tmp/answer-compose-network
```

Lihat volume yang dipakai MySQL:

```bash
docker inspect -f '{{range .Mounts}}{{.Name}} -> {{.Destination}}{{"\n"}}{{end}}' simple-mysql > /tmp/answer-compose-volume
```

```bash
cat /tmp/answer-compose-volume
```

Klik **Check** setelah network mencantumkan kedua container dan mount MySQL mengarah ke `/var/lib/mysql`.
