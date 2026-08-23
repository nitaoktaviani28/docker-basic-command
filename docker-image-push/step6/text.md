# Step 6 - Tag untuk Docker Hub

Image kita saat ini bernama:

```text
hello-nginx:v1
```

Agar dapat di-push ke Docker Hub, image perlu diberi nama sesuai repository Docker Hub.

Format:

```text
USERNAME/REPOSITORY:TAG
```

Contoh:

```text
nita123/hello-nginx:v1
```

Gunakan username Docker Hub milikmu:

```bash
docker tag hello-nginx:v1 USERNAME/hello-nginx:v1
```

Contoh:

```bash
docker tag hello-nginx:v1 nita123/hello-nginx:v1
```

Periksa kembali:

```bash
docker images
```

Sekarang seharusnya terdapat dua nama yang menunjuk ke image yang sama:

```text
hello-nginx:v1

USERNAME/hello-nginx:v1
```
