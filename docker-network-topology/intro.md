# Docker Network Topology: Bridge, Host, dan None

Selamat datang di lab Docker Networking.

Docker menyediakan beberapa mode jaringan. Tiga mode yang paling penting untuk dipahami adalah:

1. **Bridge**: container memiliki network namespace sendiri. Akses dari host memerlukan port mapping, sedangkan container dalam user-defined bridge dapat berkomunikasi melalui nama container.
2. **Host**: container menggunakan network stack milik host. Container tidak memerlukan port mapping dan aplikasi diakses melalui IP atau port host.
3. **None**: container tidak mendapat interface jaringan selain loopback. Container tidak dapat mengakses host, container lain, ataupun internet.

Lab ini menggunakan Docker Engine di Linux. Perilaku `--network host` pada Docker Desktop dapat berbeda karena Docker berjalan di dalam VM.

Klik **Start** untuk memulai.
