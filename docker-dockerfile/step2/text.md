# Step 2 - Membuat dan Memahami Dockerfile

Sekarang kita akan membuat file instruksi untuk membangun Docker Image.

## 1. Membuat Dockerfile

Buat file `Dockerfile`:

```bash
cat <<EOF > Dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

CMD ["python", "app.py"]
EOF
```

## 2. Memahami Isi Dockerfile

### FROM

```dockerfile
FROM python:3.12-slim
```

Menentukan image dasar Python yang minimal.

### WORKDIR

```dockerfile
WORKDIR /app
```

Menentukan direktori kerja di dalam container.

### COPY requirements.txt

```dockerfile
COPY requirements.txt .
```

Menyalin file dependency ke `/app`.

### RUN

```dockerfile
RUN pip install --no-cache-dir -r requirements.txt
```

Menginstall dependency saat proses build image.

### COPY app.py

```dockerfile
COPY app.py .
```

Memasukkan source code aplikasi ke image.

### EXPOSE

```dockerfile
EXPOSE 5000
```

Memberi tahu bahwa aplikasi menggunakan port `5000` di container.

### CMD

```dockerfile
CMD ["python", "app.py"]
```

Perintah utama yang dijalankan saat container start.
