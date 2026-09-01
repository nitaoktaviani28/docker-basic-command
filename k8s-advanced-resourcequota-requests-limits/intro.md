# Kubernetes Advanced - Lab 5: ResourceQuota, Requests and Limits

Selamat datang di **Kubernetes Advanced - Lab 5**.

Lab ini membahas cara Kubernetes mengatur pemakaian CPU dan memory melalui tiga konsep:

1. **ResourceQuota** membatasi total resource yang boleh dipakai dalam satu Namespace.
2. **Requests** adalah resource minimum yang dipakai scheduler untuk menempatkan Pod.
3. **Limits** adalah batas maksimum pemakaian resource oleh container.

Jika container melebihi `limits.memory`, Linux dapat menghentikannya dengan reason `OOMKilled`. Jika resource baru membuat total penggunaan melewati ResourceQuota, Kubernetes menolak pembuatan Pod tersebut.

Klik **Start** untuk memulai.
