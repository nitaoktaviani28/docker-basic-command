# Step 4 - Membuat Service NodePort untuk WordPress

Pada langkah ini, kamu akan membuat Service bertipe **NodePort** untuk WordPress.

Berbeda dengan `ClusterIP`, Service `NodePort` bisa diakses melalui IP node dan port tertentu. Ini membuat aplikasi web seperti WordPress dapat diakses dari luar Pod.

Buat file `manifests/wordpress-nodeport-service.yaml`:

```bash
cat <<EOF > manifests/wordpress-nodeport-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: wordpress-nodeport
  labels:
    app: wordpress-client
spec:
  type: NodePort
  selector:
    app: wordpress-client
  ports:
    - name: http
      port: 80
      targetPort: 80
      nodePort: 30080
EOF
```

Apply Service:

```bash
kubectl apply -f manifests/wordpress-nodeport-service.yaml
```

Cek Service:

```bash
kubectl get svc wordpress-nodeport
```

Cek detail Service:

```bash
kubectl describe svc wordpress-nodeport
```

Perhatikan bahwa `NodePort` yang digunakan adalah `30080`.

Setelah Service `wordpress-nodeport` berhasil dibuat, klik **Check**.
