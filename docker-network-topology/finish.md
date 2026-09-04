# Lab Selesai

Selamat, kamu telah menyelesaikan lab **Docker Network Topology: Bridge, Host, dan None**.

Ringkasan hasil praktik:

| Mode | Topologi | Cara akses | Komunikasi antar-container |
|---|---|---|---|
| `bridge` | WordPress dan MySQL memiliki IP internal sendiri | WordPress memakai `-p 8080:80` | WordPress menemukan MySQL lewat hostname `bridge-mysql` |
| `host` | WordPress dan MySQL berbagi network stack host | WordPress memakai IP host pada port `80`, tanpa `-p` | WordPress menjangkau MySQL lewat `127.0.0.1:3306` |
| `none` | Kedua container hanya memiliki loopback | Tidak dapat diakses melalui network | WordPress tidak dapat menjangkau MySQL |

Gunakan `bridge` sebagai pilihan umum untuk aplikasi container. Gunakan `host` bila aplikasi memang perlu menggunakan network host secara langsung dan kamu memahami risiko konflik port. Gunakan `none` untuk workload yang harus terisolasi dari jaringan.

Cleanup resource lab:

```bash
docker rm -f bridge-wordpress bridge-mysql host-wordpress host-mysql none-wordpress none-mysql
```

```bash
docker network rm wordpress-bridge
```
