# Kubernetes Advanced - Lab 3: K8s - Ingress

Selamat datang di **K8s - Ingress**, lab ketiga seri Kubernetes Advanced.

Ingress mengatur akses HTTP dan HTTPS dari luar cluster menuju Service di dalam Kubernetes. Berbeda dengan Service biasa, Ingress dapat melakukan routing berdasarkan host dan path URL.

Pada lab ini, kamu akan membuat dua backend sederhana:

1. Blue App, diakses melalui path `/blue`.
2. Green App, diakses melalui path `/green`.

Alur traffic yang akan dibuat:

```text
Client -> Ingress Controller -> app.ingress.local/blue  -> Blue App
                            -> app.ingress.local/green -> Green App
```

Kamu juga akan menginstal `ingress-nginx` sebagai Ingress Controller, lalu menguji kedua route menggunakan `curl` dan HTTP `Host` header.

Klik **Start** untuk memulai lab.
