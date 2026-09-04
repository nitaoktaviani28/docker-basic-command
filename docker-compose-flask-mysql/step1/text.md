# Membuat Aplikasi Flask dan Dockerfile

Pada tahap ini, buat project Flask sederhana. Aplikasi akan menampilkan daftar nama, menyimpan nama baru ke MySQL, dan menyediakan endpoint `/health`.

Buat folder project dan masuk ke dalamnya. Gunakan terminal yang sama pada tahap berikutnya agar posisi folder tetap benar.

```bash
mkdir -p ~/simple-python-app
```

```bash
cd ~/simple-python-app
```

Buat `app.py`:

```bash
cat <<'EOF' > app.py
from flask import Flask, request, redirect, render_template_string
import mysql.connector
import os
import time

app = Flask(__name__)


def get_db():
    for attempt in range(30):
        try:
            return mysql.connector.connect(
                host=os.getenv("DB_HOST"),
                user=os.getenv("DB_USER"),
                password=os.getenv("DB_PASSWORD"),
                database=os.getenv("DB_NAME")
            )
        except mysql.connector.Error:
            if attempt == 29:
                raise
            time.sleep(2)


HTML = """
<!DOCTYPE html>
<html>
  <head><title>Simple Name App</title></head>
  <body>
    <h1>Simple Name App</h1>
    <form method="POST">
      <input type="text" name="name" placeholder="Masukkan nama" required>
      <button type="submit">Simpan</button>
    </form>
    <h2>Daftar Nama</h2>
    <ul>{% for name in names %}<li>{{ name[0] }}</li>{% endfor %}</ul>
  </body>
</html>
"""


@app.route("/", methods=["GET", "POST"])
def index():
    db = get_db()
    cursor = db.cursor()
    if request.method == "POST":
        cursor.execute("INSERT INTO names (name) VALUES (%s)", (request.form["name"],))
        db.commit()
        cursor.close()
        db.close()
        return redirect("/")
    cursor.execute("SELECT name FROM names ORDER BY id DESC")
    names = cursor.fetchall()
    cursor.close()
    db.close()
    return render_template_string(HTML, names=names)


@app.route("/health")
def health():
    return "Application is healthy"


if __name__ == "__main__":
    db = get_db()
    cursor = db.cursor()
    cursor.execute("CREATE TABLE IF NOT EXISTS names (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL)")
    db.commit()
    cursor.close()
    db.close()
    app.run(host="0.0.0.0", port=5000)
EOF
```

Buat file dependency Python:

```bash
cat <<'EOF' > requirements.txt
Flask==3.1.0
mysql-connector-python==9.1.0
EOF
```

Buat Dockerfile:

```bash
cat <<'EOF' > Dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
EXPOSE 5000
CMD ["python", "app.py"]
EOF
```

Periksa file project:

```bash
ls -la
```

Klik **Check** setelah `app.py`, `requirements.txt`, dan `Dockerfile` tersedia.
