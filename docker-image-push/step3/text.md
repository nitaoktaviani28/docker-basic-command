# Step 3 - Login, Tag, dan Push ke Docker Hub

1. Login ke Docker Hub:

```bash
docker login
```

2. Tag image lokal agar sesuai format repository Docker Hub:

```bash
docker tag hello-nginx:v1 USERNAME/hello-nginx:v1
```

3. Push image ke Docker Hub:

```bash
docker push USERNAME/hello-nginx:v1
```

Ganti `USERNAME` dengan username Docker Hub milikmu.
