# Lab Selesai

Selamat, kamu telah menyelesaikan **Kubernetes Advanced - Lab 5: ResourceQuota, Requests and Limits**.

Kamu sudah membuat ResourceQuota per Namespace, mengatur requests dan limits pada Deployment, membaca pemakaian quota, menganalisis replica yang ditolak karena quota, dan membuktikan efek memory limit melalui `OOMKilled`.

Requests membantu scheduler memilih Node yang memadai, limits membatasi pemakaian container, sedangkan ResourceQuota menjaga total penggunaan resource antar workload dalam Namespace.

Cleanup resource lab:

```bash
kubectl delete namespace quota-lab
```
