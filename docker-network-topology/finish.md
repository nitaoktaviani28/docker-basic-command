# Lab Selesai

Selamat, kamu telah menyelesaikan lab **Docker Network Topology: Bridge, Host, dan None**.

Ringkasan hasil praktik:

| Mode | Topologi | Cara akses | Komunikasi antar-container |
|---|---|---|---|
| `bridge` | Container memiliki IP dan network namespace sendiri | Host memakai `-p HOST_PORT:CONTAINER_PORT` | Bisa lewat DNS nama container pada user-defined bridge |
| `host` | Container berbagi network stack dengan host | Pakai IP host dan port aplikasi, tanpa `-p` | Tidak ada isolasi network dari host |
| `none` | Hanya interface loopback | Tidak dapat diakses melalui network | Tidak dapat mengakses host, container lain, atau internet |

Gunakan `bridge` sebagai pilihan umum untuk aplikasi container. Gunakan `host` bila aplikasi memang perlu menggunakan network host secara langsung dan kamu memahami risiko konflik port. Gunakan `none` untuk workload yang harus terisolasi dari jaringan.

Cleanup resource lab:

```bash
docker rm -f bridge-web host-web none-isolated
docker network rm webinar-bridge
```
