## Perintah-Perintah Verifikasi Switch
```
$ show interfaces
$ show startup-config
$ show running-config
$ show flash
$ show version
$ show history
$ show ip interface
$ show ipv6 interface
$ show mac-address-table
```
### Sebagai contoh, menampilkan informasi pada interface fa0/1:
```
$ sh int fa0/1
```
### Note
- Input Errors = Jumlah error yang diterima ketika paket diperiksa.
- Runts = Paket yang ditolak.
- Giants = Paket yang berlebihan, lebih dari 1518 bytes.
- CRC = CRC Error.
- Output Errors = Jumlah error pada datagram akhir setelah diperiksa.
- Collisions = Jumlah collision.
- Late Collisions = Collision yang terjadi setelah 512 bits.
