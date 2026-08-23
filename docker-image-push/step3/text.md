# Step 3 - Login, Tag, dan Push ke Docker Hub

Set username Docker Hub sebagai variabel agar tidak salah ketik:

```bash
export DOCKERHUB_USER="USERNAME_KAMU"
```

1. Login ke Docker Hub:

```bash
docker login
```

2. Tag image lokal agar sesuai format repository Docker Hub:

```bash
docker tag hello-nginx:v1 $DOCKERHUB_USER/hello-nginx:v1
```

3. Push image ke Docker Hub:

```bash
docker push $DOCKERHUB_USER/hello-nginx:v1
```

Jangan menulis `USERNAME` secara literal di command run/pull/push karena Docker akan menganggapnya sebagai hostname registry.
