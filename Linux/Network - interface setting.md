### Mempercepat Koneksi Internet di Ubuntu dan Turunannya
#### Berikut ini caranya:
- Buka terminal dengan cara klik <code>Applications</code>-><code>Accessories</code>-><code>Terminal</code>
- Agar anda bisa dengan mudah mengembalikan ke kondisi semula jika terjadi masalah buatlah backup filnya dengan cara
<pre>sudo cp /etc/sysctl.conf /etc/sysctl.conf.cadangan </pre>
- jadi file backup anda adalah <code>sysctl.conf.cadangan</code>
- Ketik perintah
<code>sudo gedit /etc/sysctl.conf</code>
- Masukkan kode berikut di akhir file yang anda edit tadi
```
# increase TCP max buffer size setable using setsockopt()
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
# increase Linux autotuning TCP buffer limits
# min, default, and max number of bytes to use
# set max to at least 4MB, or higher if you use very high BDP paths
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
# don’t cache ssthresh from previous connection
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
# recommended to increase this for 1000 BT or higher
net.core.netdev_max_backlog = 30000
# Turn off timestamps if you’re on a gigabit or very busy network
# Having it off is one less thing the IP stack needs to work on
#net.ipv4.tcp_timestamps = 0
# disable tcp selective acknowledgements.
net.ipv4.tcp_sack = 0
#enable window scaling
net.ipv4.tcp_window_scaling = 1 
```
- Simpan file yang telah di edit lalu exit
- Masukkan perintah
`sudo sysctl -p`
- Untuk mematikan/mendisable anda bisa menghilangkan kode yang kita tambahkan tadi buka kembali file tadi
`sudo gedit /etc/sysctl.conf`
