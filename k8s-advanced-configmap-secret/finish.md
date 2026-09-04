# Lab Selesai

Selamat, kamu telah menyelesaikan **Kubernetes Advanced - Lab 2: ConfigMap and Secret**.

Kamu sudah belajar membuat ConfigMap dan Secret melalui command, file `.env`, serta YAML. Kamu juga sudah membuktikan bahwa kedua resource tersebut dapat diteruskan ke container sebagai environment variable dengan `envFrom`.

Gunakan ConfigMap untuk konfigurasi biasa. Gunakan Secret untuk data sensitif, lalu batasi aksesnya dengan RBAC. Ingat bahwa Base64 hanya encoding, bukan enkripsi.

Cleanup resource lab:

```bash
kubectl delete deployment nginx-env-demo
```

```bash
kubectl delete configmap app-config-command app-config-env app-config-yaml
```

```bash
kubectl delete secret app-secret-command app-secret-env app-secret-yaml
```
