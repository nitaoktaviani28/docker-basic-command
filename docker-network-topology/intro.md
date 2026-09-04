# Docker Network Topology: Bridge, Host, dan None

Selamat datang di lab Docker Networking.

Docker menyediakan beberapa mode jaringan. Tiga mode yang paling penting untuk dipahami adalah:

1. **Bridge**: WordPress dan MySQL memiliki IP sendiri, berada pada user-defined bridge yang sama, dan dapat saling berkomunikasi melalui nama container. WordPress diekspos keluar memakai port mapping.
2. **Host**: WordPress dan MySQL langsung menggunakan network stack host. WordPress diakses melalui IP host tanpa port mapping.
3. **None**: WordPress dan MySQL tidak memiliki interface jaringan selain loopback, sehingga WordPress tidak dapat terhubung ke MySQL.

Lab ini menggunakan Docker Engine di Linux. Perilaku `--network host` pada Docker Desktop dapat berbeda karena Docker berjalan di dalam VM.

Klik **Start** untuk memulai.
