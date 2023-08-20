### Cara menggunakan NFS  di OS Linux?

- Pastikan kamu sudah memiliki layanan NFS storage yang memang bisa untuk di mount ke komputer lain.
- masuk ke OS linux yang akan kamu pasang / mount NFS nya
- ketik perintah ini untuk install properti NFS client :
```
yum -y install nfs-utils
```
- buat folder baru
```
mkdir /backup
```
- mount storage NFS kamu
```
mount -t nfs 10.10.10.5:/mnt/backup/data /backup/
```
- pasang NFS mount pada <code>/etc/fstab</code> agar pada waktu booting secara otomatis NFS akan ter-load
```
10.10.10.5:/mnt/backup/data /backup nfs soft,timeo=500,_netdev 0 0
```
* <code>soft</code>: kegunaan soft ini agar jika NFS error, dia tidak akan menjadi hang/menggantung tetapi dia akan memunculkan error message
* <code>timeo</code>: digunakan untuk timeout hingga 500 deciseconds (50 detik)
* <code>_netdev</code>: digunakan agar NFS di mount setelah networking sudah establish
- Reboot server dan pastikan NFS juga tetap terbaca dengan baik.

### Reff = <a href="https://www.natanetwork.com/portal/knowledgebase/268/Mount-external-storage-menggunakan-NFS-pada-server-Linux.html">Mount-external-storage-menggunakan-NFS-pada-server-Linux</a>
