# Cara Konek Ke WiFi di Linux Menggunakan Perintah `iw`


# Cek dulu nama interface wirelessmu menggunakan perintah dibawah ini
```
$ iwconfig
```

## Pastikan signal radio WiFi mu telah terenable dan wlan interface mu telah terenable juga, gunakan perintah dibawah ini
```
$ sudo rfkill unblock wlan
$ sudo ip link set nama_interface up
```

## Cari WiFi hotspot yang ada di sekitarmu dengan melakukan scann menggunakan perintah
```
$ iwlist nama_interface_wifi scan
```

Perhatikan informasi yang didapat untuk setiap AP terutama ESSID dan encryption key, jika  encryption key:on maka hotspot tersebut bersifat tertutup dan memerlukan password untuk kamu bisa konek.

## Untuk konek ke WiFi hotspot gunakan format peritah 
```
$ sudo iw dev nama_wifi_interface connect nama_ESSID_hotspot
### example
$ sudo iw dev wlp7s0 connect -w RAPMS-B
```
Tapi jika WiFi yanng ingin kamu konekin menggunakan password maka kamu bisa menambahkan opsi key s:passwordmu, lihat contoh ini
```
$ sudo iw dev wlp7s0 connect RAPMS-B key s:password_wifi_mu
```
## Untuk melihat status Wifimu apakah sudah terkonek dengan accesspoint hotspot kamu bisa menggunakan perintah 
```
$ iwconfig
```
Jika pada ESSID sudah tertera sesuai dengan SSID hotspot yang ingin kita konek berarti koneksi ke hotspot telah berhasil.
