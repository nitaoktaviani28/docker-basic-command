# Lab Selesai

Selamat, kamu telah menyelesaikan **Kubernetes Advanced - Lab 4: K8s - Scale Replica and Rolling Update**.

Pada lab ini kamu sudah membuat Deployment awal, melakukan scale up dan scale down, memperbarui image dengan rolling update, lalu melakukan rollback ke revision sebelumnya.

Konsep ini penting untuk menjaga aplikasi tetap tersedia saat kapasitas workload berubah atau saat versi baru perlu dirilis dengan aman.

Cleanup resource lab:

```bash
kubectl delete namespace rollout-lab
```
