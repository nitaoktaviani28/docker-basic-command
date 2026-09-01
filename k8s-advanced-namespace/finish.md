# Lab Selesai

Selamat, kamu telah menyelesaikan **Kubernetes Advanced - Lab 1: Namespace**.

Di lab ini kamu sudah mempraktikkan pembuatan Namespace melalui command dan YAML, membuat Deployment pada Namespace tertentu, serta memahami batas unik nama resource.

Hal utama yang perlu diingat: nama resource harus unik dalam satu Namespace, tetapi nama yang sama dapat dipakai kembali pada Namespace lain. Inilah dasar pemisahan environment dan workload dalam satu Kubernetes cluster.

Jika ingin membersihkan resource lab, jalankan:

```bash
kubectl delete deployment nginx-app -n default
kubectl delete deployment nginx-app -n dev
kubectl delete deployment nginx-app -n prod
kubectl delete namespace dev prod
```
