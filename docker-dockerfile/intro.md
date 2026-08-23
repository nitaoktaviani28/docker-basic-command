# Lab Membuat Docker Image dengan Dockerfile

## Tujuan

Pada lab ini kita akan belajar bagaimana sebuah aplikasi dapat dikemas menjadi Docker Image menggunakan Dockerfile.

Sebagai contoh, kita akan menggunakan aplikasi sederhana berbasis Python Flask.

## Alur Lab (Step by Step)

### Step 1 - Menjalankan Aplikasi Tanpa Docker
- Membuat source code `app.py`.
- Menyiapkan Python environment dan dependency Flask.
- Menjalankan aplikasi manual untuk memahami kebutuhan runtime.

### Step 2 - Membuat dan Memahami Dockerfile
- Membuat file `Dockerfile`.
- Memahami instruksi dasar: `FROM`, `WORKDIR`, `COPY`, `RUN`, `EXPOSE`, dan `CMD`.

### Step 3 - Build Docker Image
- Build image menggunakan `docker build`.
- Memverifikasi image dengan `docker images`.

### Step 4 - Menjalankan dan Verifikasi Container
- Menjalankan container dari image hasil build.
- Verifikasi status container dan akses aplikasi via port host.
- Melihat hostname container untuk memahami isolasi.

### Step 5 - Melihat Log dan Ringkasan
- Melihat log container dengan `docker logs`.
- Merangkum perbedaan workflow tanpa Docker vs dengan Docker.

Klik Start untuk masuk ke Step 1, lalu lanjutkan ke step berikutnya sampai selesai.
