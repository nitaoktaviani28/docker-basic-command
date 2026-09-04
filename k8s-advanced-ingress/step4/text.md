# Membuat Ingress Path-Based Routing

Pada tahap ini, kamu akan membuat satu object Ingress untuk mengarahkan request ke backend yang tepat berdasarkan path URL.

Target routingnya adalah:

```text
app.ingress.local/blue  -> svc-web-blue:80
app.ingress.local/green -> svc-web-green:80
```

Buat manifest Ingress berikut:

```bash
cat <<EOF > manifests/app-ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
  namespace: ingress-lab
spec:
  ingressClassName: nginx
  rules:
    - host: app.ingress.local
      http:
        paths:
          - path: /blue
            pathType: Prefix
            backend:
              service:
                name: svc-web-blue
                port:
                  number: 80
          - path: /green
            pathType: Prefix
            backend:
              service:
                name: svc-web-green
                port:
                  number: 80
EOF
```

Terapkan dan lihat detail rule-nya:

```bash
kubectl apply -f manifests/app-ingress.yaml
```

```bash
kubectl get ingress app-ingress -n ingress-lab
```

```bash
kubectl describe ingress app-ingress -n ingress-lab
```

Pada environment bare-metal, kolom `ADDRESS` bisa kosong. Kondisi tersebut normal; akses akan dilakukan melalui NodePort Service controller pada tahap berikutnya.

Klik **Check** setelah Ingress `app-ingress` berhasil dibuat.
