# Lab Selesai

Selamat, kamu telah menyelesaikan **Lab 3 - Deployment**.

Pada lab ini, kamu sudah mempelajari:

1. Cara membuat Deployment dengan command `kubectl create deployment`.
2. Cara membuat Deployment menggunakan file YAML.
3. Cara melakukan scale up dan scale down pada replica.
4. Cara mengupdate image Deployment menggunakan rolling update.
5. Cara melihat self-healing saat Pod dihapus.
6. Cara memahami struktur YAML dari sebuah Deployment.

Deployment adalah salah satu resource paling penting di Kubernetes karena mengelola lifecycle Pod secara otomatis, mulai dari pembuatan, scaling, update, hingga pemulihan saat terjadi gangguan.

Cleanup:

```bash
kubectl delete deployment nginx-command nginx-yaml
```

Lanjutkan ke lab berikutnya untuk memperdalam pemahaman Kubernetes kamu secara bertahap.
