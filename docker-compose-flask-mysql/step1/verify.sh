#!/bin/bash
set -euo pipefail

project_dir="$HOME/simple-python-app"

for file in app.py requirements.txt Dockerfile; do
  if [ ! -f "$project_dir/$file" ]; then
    echo "File $file belum ditemukan di $project_dir."
    exit 1
  fi
done

grep -q "Flask" "$project_dir/app.py" && grep -q "mysql.connector" "$project_dir/app.py" && grep -q "FROM python:3.12-slim" "$project_dir/Dockerfile" || {
  echo "Isi aplikasi atau Dockerfile belum sesuai."
  exit 1
}

echo "Step 1 benar: source code Flask dan Dockerfile sudah siap."
