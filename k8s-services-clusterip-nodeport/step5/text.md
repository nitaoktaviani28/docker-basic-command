# Step 5 - Menguji akses Service dengan curl

Pada langkah ini, kamu akan menguji apakah WordPress benar-benar bisa diakses melalui Service `NodePort`.

Ambil IP node:

```bash
kubectl get nodes -o wide
```

Biasanya pada environment lab satu node, kamu juga bisa menggunakan IP lokal dari host:

```bash
hostname -i
```

Sekarang lakukan `curl` ke Service NodePort WordPress:

```bash
curl -I http://127.0.0.1:30080
```

Jika `127.0.0.1` belum berhasil, coba gunakan IP node dari output `kubectl get nodes -o wide` atau `hostname -i`:

```bash
curl -I http://<NODE-IP>:30080
```

Untuk kebutuhan verifikasi, simpan HTTP status code ke file berikut:

```bash
curl -I -s http://127.0.0.1:30080 | head -n 1 | awk '{print $2}' > /tmp/answer-nodeport-http-code
```

Jika `127.0.0.1` tidak berhasil di environment kamu, gunakan node IP:

```bash
curl -I -s http://<NODE-IP>:30080 | head -n 1 | awk '{print $2}' > /tmp/answer-nodeport-http-code
```

Status yang umum muncul adalah `200`, `301`, atau `302`, tergantung respons awal dari WordPress.

Setelah itu klik **Check**.
