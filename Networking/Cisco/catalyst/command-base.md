### 1. Memberikan password pada Mode User / Line Console.
```
//Password saja
cisco> enable
cisco# configure terminal
cisco(config)# line console 0
cisco(config-line)# password cisco
cisco(config-line)# login

//Username dan Password
cisco(config)# username cisco password network
cisco(config)# line console 0
cisco(config-line)# login local
``` 
### 2. Memberikan password pada Privilege Mode.
```
//Password tidak terenkripsi
cisco(config)# enable password ciscopass

//Password terkenskripsi
cisco(config)# enable secret ciscopass

//Melakukan enkripsi semua password, termasuk password console. 
cisco(config)# service password-encryption
```
### 3. Melihat konfigurasi yang sedang berjalan.
```
cisco# show running-config
```

### 4. Menampilkan informasi device.
```
S1# show version
```

### 5. Menampilkan informasi konten yang ada di memori flash.
```
S1# show flash
```

### 6. Melakukan backup konfigurasi yang sedang berjalan ke startup.
```
S1# copy running-config startup-config
```

### 7. Melakukan backup konfigurasi yang sedang berjalan ke TFTP Server.
```
S1# copy running-config tftp
```

### 8. Set Boot System.
```
S1# show boot
S1# boot system flash:/c2960-lanbasek9-mz.150-2.SE/c2960-lanbasek9-mz.150-2.SE.bin
```

### 9. Melakukan recovery ketik terjadi crash pada sistem.
```
$ set
$ flash_init
$ dir flash:
$ BOOT=flash:c2960-lanbasek9-mz.150-2.SE8.bin
$ set
$ boot
```
