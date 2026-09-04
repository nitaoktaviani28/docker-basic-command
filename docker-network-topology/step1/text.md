# Bridge Network dan Port Mapping

`bridge` adalah mode jaringan Docker yang umum digunakan. Container mendapat IP sendiri di jaringan Docker dan dipisahkan dari network host. Agar aplikasi di dalam container dapat diakses dari host, kita membuat **port mapping**.

Pada lab ini kita menggunakan user-defined bridge bernama `webinar-bridge`. Keuntungannya adalah Docker menyediakan DNS internal, sehingga container dapat saling menemukan lewat nama container.

Buat network bridge:

```bash
docker network create --driver bridge webinar-bridge
```

Lihat daftar network Docker untuk memastikan network berhasil dibuat:

```bash
docker network ls
```

Jalankan web server Nginx pada bridge dan map port host `8080` ke port container `80`:

```bash
docker run -d \
  --name bridge-web \
  --network webinar-bridge \
  -p 8080:80 \
  nginx:1.25
```

Arti `-p 8080:80` adalah:

| Bagian | Arti |
|---|---|
| `8080` | Port pada host atau mesin tempat Docker berjalan. |
| `80` | Port aplikasi di dalam container. Nginx mendengarkan HTTP pada port ini. |

Dengan demikian, request ke `http://127.0.0.1:8080` diteruskan Docker ke port `80` milik container `bridge-web`. Format umum port mapping adalah `-p HOST_PORT:CONTAINER_PORT`.

Periksa network mode, IP container, dan mapping port:

```bash
docker inspect -f '{{.HostConfig.NetworkMode}}' bridge-web
```

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' bridge-web
```

```bash
docker port bridge-web
```

Akses aplikasi dari host melalui port mapping:

```bash
curl -fsS http://127.0.0.1:8080 > /tmp/answer-bridge-host-access
```

Tampilkan bukti bahwa web server Nginx merespons:

```bash
grep -o 'Welcome to nginx!' /tmp/answer-bridge-host-access
```

Topologinya:

```text
Host port 8080 -> Docker port mapping -> bridge-web:80
```

Klik **Check** setelah `Welcome to nginx!` muncul.
