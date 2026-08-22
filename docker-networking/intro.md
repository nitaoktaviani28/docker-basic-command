# Docker Networking: Bridge, Host, dan None

## Tujuan

Pada lab ini, kamu akan mempraktikkan tiga mode network Docker menggunakan container Nginx:

- `bridge`
- `host`
- `none`

## Alur Lab (Step by Step)

### Step 1 - Bridge Network
- Menjalankan Nginx dengan network `bridge`.
- Mengakses container melalui port mapping `8080:80`.

### Step 2 - Host Network
- Menjalankan Nginx dengan network `host`.
- Memahami kenapa mode ini tidak memakai `-p`.

### Step 3 - None Network
- Menjalankan Nginx dengan network `none`.
- Melihat perilaku container tanpa koneksi network eksternal.

### Step 4 - Perbandingan Mode
- Membandingkan `bridge`, `host`, dan `none`.
- Memahami kapan masing-masing mode digunakan.

### Step 5 - Cleanup dan Ringkasan
- Membersihkan container lab.
- Merangkum perbedaan utama ketiga mode network.

Klik **Start** untuk masuk ke **Step 1**, lalu lanjutkan ke step berikutnya.
