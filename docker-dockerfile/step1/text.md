# Step 1 - Menjalankan Aplikasi Tanpa Docker

Sebelum membuat Docker Image, kita jalankan aplikasi secara langsung pada environment Linux.

Tujuannya agar kita memahami terlebih dahulu apa saja yang dibutuhkan aplikasi untuk dapat berjalan.

## 1. Membuat Source Code

Buat file `app.py`:

```bash
cat <<EOF > app.py
from flask import Flask
import socket

app = Flask(__name__)

@app.route("/")
def hello():
    hostname = socket.gethostname()
    return f"<h1>Hello World!</h1><p>Running on: <b>{hostname}</b></p>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF
```

Aplikasi menyediakan satu endpoint `/` dan berjalan pada port `5000`.

## 2. Menyiapkan Python Environment

Install package untuk virtual environment:

```bash
apt update ; apt install -y python3-venv
```

Buat virtual environment:

```bash
python3 -m venv venv
```

Aktifkan environment:

```bash
source venv/bin/activate
```

Jika berhasil, biasanya terminal menampilkan `(venv)` di awal prompt.

## 3. Menyiapkan Dependency

Buat file `requirements.txt`:

```bash
echo "flask" > requirements.txt
```

Install dependency:

```bash
pip install -r requirements.txt
```

## 4. Menjalankan Aplikasi

Jalankan aplikasi di background:

```bash
python3 app.py > app.log 2>&1 & echo $! > app.pid
```

Uji response aplikasi:

```bash
curl localhost:5000
```

Jika berhasil akan muncul output seperti:

```text
<h1>Hello World!</h1><p>Running on: ...</p>
```

## 5. Menghentikan Aplikasi Manual

Setelah pengujian selesai:

```bash
kill $(cat app.pid)
```

Keluar dari virtual environment:

```bash
deactivate
```

Pada tahap ini aplikasi masih berjalan langsung pada environment Linux, belum dikemas dalam container.
