#!/bin/bash
set -euo pipefail

namespace="ingress-lab"

if ! kubectl get ingress app-ingress -n "$namespace" >/dev/null 2>&1; then
  echo "Ingress app-ingress belum ditemukan."
  exit 1
fi

class_name="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.ingressClassName}')"
host="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].host}')"
blue_path="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[0].path}')"
blue_service="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.name}')"
blue_port="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[0].backend.service.port.number}')"
green_path="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[1].path}')"
green_service="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[1].backend.service.name}')"
green_port="$(kubectl get ingress app-ingress -n "$namespace" -o jsonpath='{.spec.rules[0].http.paths[1].backend.service.port.number}')"

if [ "$class_name" != "nginx" ] || [ "$host" != "app.ingress.local" ]; then
  echo "IngressClass atau host Ingress belum sesuai."
  exit 1
fi

if [ "$blue_path" != "/blue" ] || [ "$blue_service" != "svc-web-blue" ] || [ "$blue_port" != "80" ]; then
  echo "Route /blue belum mengarah ke svc-web-blue:80."
  exit 1
fi

if [ "$green_path" != "/green" ] || [ "$green_service" != "svc-web-green" ] || [ "$green_port" != "80" ]; then
  echo "Route /green belum mengarah ke svc-web-green:80."
  exit 1
fi

echo "Step 4 benar: Ingress path-based routing sudah sesuai."
