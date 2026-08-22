# Docker Basic Command - Step 2

Pada tahap ini, kamu akan belajar penamaan container dan mode background/foreground.

## 5. Menjalankan Container dengan Nama

### Command
```bash
docker run -d --name nginx-basic nginx
```

### Tujuan
Membuat container Nginx di background dengan nama yang ditentukan sendiri.

Dengan nama sendiri, pengelolaan jadi lebih mudah:

```bash
docker logs nginx-basic
docker stop nginx-basic
docker start nginx-basic
docker restart nginx-basic
```

### Verifikasi
```bash
docker ps
```

## 6. Memahami Mode Background (`-d`)

### Command
```bash
docker run -d --name nginx-background nginx
```

### Tujuan
`-d` (detached mode) membuat container berjalan di background dan terminal langsung kembali ke prompt.

### Verifikasi
```bash
docker ps
```

Cleanup sebelum lanjut:
```bash
docker stop nginx-basic nginx-background
docker rm nginx-basic nginx-background
```

## 7. Menjalankan Container Tanpa `-d` (Foreground)

### Command
```bash
docker run --name nginx-foreground nginx
```

### Tujuan
Tanpa `-d`, container berjalan di foreground sehingga terminal tetap terhubung ke proses container.

Hentikan proses foreground dengan:
- `Ctrl + C`

### Verifikasi
```bash
docker ps -a
```

Kamu masih bisa menjalankan ulang container:

```bash
docker start nginx-foreground
```

Cleanup:
```bash
docker rm -f nginx-foreground
```

## 8. Menjalankan Nginx di Background dengan Nama

### Command
```bash
docker run -d --name nginx-basic nginx
```

### Tujuan
Menyiapkan container `nginx-basic` untuk latihan step berikutnya.

### Verifikasi
```bash
docker ps
```

Lanjutkan ke **Next** untuk tahap berikutnya.
