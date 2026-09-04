# Membuktikan Data Tetap Ada

Named volume membuat data MySQL tetap ada meskipun container dihentikan dan dibuat ulang. Pada tahap ini, hapus container Compose tanpa menghapus volume.

Pastikan berada di folder project:

```bash
cd ~/simple-python-app
```

Hentikan dan hapus container. Jangan tambahkan `-v`, karena opsi itu akan menghapus volume beserta data database:

```bash
docker compose down
```

Jalankan kembali service menggunakan volume yang sama:

```bash
docker compose up -d
```

Tunggu aplikasi siap:

```bash
until curl -fsS http://127.0.0.1:5000/health > /tmp/answer-persistence-health; do sleep 2; done
```

Ambil halaman aplikasi setelah container dibuat ulang:

```bash
curl -fsSL http://127.0.0.1:5000 > /tmp/answer-persistence
```

```bash
grep -o '<li>Nita</li>' /tmp/answer-persistence
```

Jika `Nita` masih muncul, data tidak disimpan di layer container MySQL, melainkan di named volume `mysql_data`.

Klik **Check** setelah nama `Nita` tetap terlihat.
