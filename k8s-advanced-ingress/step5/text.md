# Testing Akses Ingress

Sekarang uji rule Ingress menggunakan `curl`. Karena rule memakai host `app.ingress.local`, setiap request harus membawa HTTP header `Host: app.ingress.local`.

Ambil NodePort untuk port HTTP milik Ingress Controller:

```bash
INGRESS_HTTP_NODEPORT=$(kubectl get svc ingress-nginx-controller -n ingress-nginx -o jsonpath='{.spec.ports[?(@.name=="http")].nodePort}')
```

```bash
echo "$INGRESS_HTTP_NODEPORT"
```

Ambil Internal IP node:

```bash
NODE_IP=$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[?(@.type=="InternalIP")].address}')
```

```bash
echo "$NODE_IP"
```

Uji route Blue App dan simpan response-nya:

```bash
curl -s -H "Host: app.ingress.local" "http://${NODE_IP}:${INGRESS_HTTP_NODEPORT}/blue"
```

```bash
curl -s -H "Host: app.ingress.local" "http://${NODE_IP}:${INGRESS_HTTP_NODEPORT}/blue" > /tmp/answer-ingress-blue
```

```bash
cat /tmp/answer-ingress-blue
```

Response yang benar:

```text
Hello from Blue App via Ingress
```

Uji route Green App dan simpan response-nya:

```bash
curl -s -H "Host: app.ingress.local" "http://${NODE_IP}:${INGRESS_HTTP_NODEPORT}/green"
```

```bash
curl -s -H "Host: app.ingress.local" "http://${NODE_IP}:${INGRESS_HTTP_NODEPORT}/green" > /tmp/answer-ingress-green
```

```bash
cat /tmp/answer-ingress-green
```

Response yang benar:

```text
Hello from Green App via Ingress
```

Jika mendapat `404`, cek kembali host, path, Service backend, dan endpoint:

```bash
kubectl describe ingress app-ingress -n ingress-lab
```

```bash
kubectl get svc,endpoints -n ingress-lab
```

Klik **Check** setelah kedua response tersimpan dengan benar.
