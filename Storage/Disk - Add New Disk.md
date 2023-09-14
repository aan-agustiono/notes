# Utilities Tools handle Second Disk or New mounting drive.


## Linux Hard Disk Format Command
"How do I format a hard disk under Linux operating system from a shell prompt?"

There are four steps involved for hard disk upgrade and installation procedure under Linux. First, let us see how to format disk partition in Linux.

### Step #1 : Partition the new disk using the fdisk command
```
PS C:\Users\Agustiono> ssh.exe ants@nfs-s.infra.lab
ants@nfs-s.infra.lab's password:
Linux nfs-s 6.1.0-11-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.38-4 (2023-08-08) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sun Sep  3 19:40:15 2023 from 192.168.90.2
ants@nfs-s:~$ sudo -i
[sudo] password for ants:
root@nfs-s:~#
```
The following fdisk command will list all detected hard disks under Linux:
```
root@nfs-s:~# fdisk -l | grep '^Disk'
Disk /dev/sda: 50 GiB, 53687091200 bytes, 104857600 sectors
Disk model: VBOX HARDDISK
Disklabel type: dos
Disk identifier: 0x7025de14
Disk /dev/sdb: 150 GiB, 161061273600 bytes, 314572800 sectors
Disk model: VBOX HARDDISK
root@nfs-s:~#
```
Another option is to type the `lsblk` command:
```
root@nfs-s:~# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    0   50G  0 disk
├─sda1   8:1    0   49G  0 part /
├─sda2   8:2    0    1K  0 part
└─sda5   8:5    0  975M  0 part [SWAP]
sdb      8:16   0  150G  0 disk
sr0     11:0    1 1024M  0 rom
root@nfs-s:~#
```
To partition the disk – /dev/sdb,(incase drive extension 'sdb' will be added). enter:
```
fdisk /dev/sdb
```

```
root@nfs-s:~# fdisk /dev/sdb

Welcome to fdisk (util-linux 2.38.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS (MBR) disklabel with disk identifier 0x6faaf117.

Command (m for help):
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p):

Using default response p.
Partition number (1-4, default 1):
First sector (2048-314572799, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-314572799, default 314572799):

Created a new partition 1 of type 'Linux' and of size 150 GiB.

Command (m for help):
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

root@nfs-s:~#
```

### Step#2 : Format the new disk using mkfs command
cek if disk a ready to format with `lsblk` 
```
root@nfs-s:~# lsblk
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    0   50G  0 disk
├─sda1   8:1    0   49G  0 part /
├─sda2   8:2    0    1K  0 part
└─sda5   8:5    0  975M  0 part [SWAP]
sdb      8:16   0  150G  0 disk
└─sdb1   8:17   0  150G  0 part
sr0     11:0    1 1024M  0 rom
root@nfs-s:~#
```
new drive will be show, for this case drive 'sdb1', and format it with `mkfs.ext4` on drive sdb1.
```
root@nfs-s:~# mkfs.ext4 /dev/sdb1
mke2fs 1.47.0 (5-Feb-2023)
Creating filesystem with 39321344 4k blocks and 9830400 inodes
Filesystem UUID: df2b394e-fde1-42a0-a1fe-3a0033e30d47
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872

Allocating group tables: done
Writing inode tables: done
Creating journal (262144 blocks):
done
Writing superblocks and filesystem accounting information: done

root@nfs-s:~#
```

### Step#3 : Mount the new disk using mount command
```
root@nfs-s:~# mkdir /mnt/secondarydisk01
root@nfs-s:~# mount /dev/sdb1 /mnt/secondarydisk01/
root@nfs-s:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            459M     0  459M   0% /dev
tmpfs            97M  468K   96M   1% /run
/dev/sda1        48G  1.8G   44G   4% /
tmpfs           481M     0  481M   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
tmpfs            97M     0   97M   0% /run/user/1000
/dev/sdb1       147G   28K  140G   1% /mnt/secondarydisk01
root@nfs-s:~#
```

### Step#4 : Update /etc/fstab file
Make sure our partition automatically mounted at boot time. Open the /etc/fstab file, enter:
```
root@nfs-s:~# vim /etc/fstab
```
-------- edit file on `/etc/fstab` ------------
```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# systemd generates mount units based on this file, see systemd.mount(5).
# Please run 'systemctl daemon-reload' after making changes here.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=a56b9418-65c2-49d8-b614-ae708994e3ac /               ext4    errors=remount-ro 0       1
# swap was on /dev/sda5 during installation
UUID=5733268b-b507-4c30-b0ab-293d576b3bda none            swap    sw              0       0
/dev/sr0        /media/cdrom0   udf,iso9660 user,noauto     0       0
/dev/sdb1       /mnt/secondarydisk01    ext4    defaults        1 2
```


<u>Table Notes</u>
<table >
<thead>
<tr><th>Coloum</th><th>Function</th><th>Value</th><th>Notes</th></tr>
</thead>
<tbody>
<tr valign='top'><td>1</td><td>file system</td><td>/dev/sdb1 (example)</td><td>[partisi/disk] partisi yang ada di dalam disk. sebagai contoh `/dev/sda1` berarti kita merujuk pada partisi yang ada di drive kita yang pertama.</td></tr>
<tr valign='top'><td>2</td><td>mount point</td><td>/mnt/diskmount (example)</td><td>[mount point] lokasi dimana partisi akan di-mount. kebanyakan distro meletakkan mount point di bawah direktori `/mnt`, ada juga yang meletakkannya di `/media` (salah satunya SuSE).</td></tr>
<tr valign='top'><td>3</td><td>type</td><td>
<ul>
<li><b>ext2</b>, <b>ext3</b>, <b>ext4</b> partisi yang umum dipakai untuk sistem operasi linux</li>
<li><b>reiserfs</b> buat linux juga. katanya lebih advanced</li>
<li><b>swap</b> jenis partisi yang digunakan untuk membantu RAM ketika RAM membutuhkan memori yang lebih</li>
<li><b>vfat</b> biasa di pakai windows, contohnya FAT32</li>
<li><b>ntfs</b> biasa di pakai windows juga</li>
<li><b>auto</b> opsi untuk mendeteksi secara otomatis jenis partisi yang dituju</li>
</ul>
</td><td>[jenis partisi] tipe data dari partisi yang dituju pada kolom #1.</td></tr>
<tr valign='top'><td>4</td><td>options</td><td>
<ul>
<li><b>auto</b> partisi akan di-mount secara otomatis di awal boot</li>
<li><b>noauto</b> kebalikannya auto, partisi tidak di-mount di awal boot
<li><b>user</b> mengijinkan normal user untuk mem-mount partisi</li>
<li><b>nouser</b> hanya memperbolehkan root untuk mem-mount partisi</li>
<li><b>exec</b> memperbolehkan untuk mengeksekusi sebuah file binary</li>
<li><b>noexec</b> kebalikan dari exec</li>
<li><b>ro</b> mem-mount partisi secara read-only</li>
<li><b>rw</b> mem-mount partisi secara read-write</li>
<li><b>sync</b> berarti proses eksekusi terhadap suatu file. sync berarti synchronous. sebagai contoh pada drive jenis floppy menggunakan opsi ini. ini berarti ketika kita meng-copy suatu file kedalam floppy, maka pada saat yang bersamaan file ter-copy kedalam disk.</li>
<li><b>async</b> kebalikan dari sync, asynchronous. sebagai contoh pada drive jenis floppy jika menggunakan opsi ini maka ketika kita meng-copy suatu file kemudian meng-eject-nya, kemungkinan file belum ter-copy kedalam floppy karena opsi ini mengeksekusi perintah copy tidak bersamaan ketik kita memberikan perintah copy.</li>
<li><b>defaults</b> opsi yang digunakan rw, suid, dev, exec, auto, nouser, dan async</li>
</ul>
</td><td>mount options, 
konfigurasi yang lebih pada partisi yang akan di-mount.
untuk penggunaan opsi yang beruntun, dapat digunakan tanda koma “,” sebagai pemisah.
</td></tr>
<tr valign='top'><td>5</td><td>dump</td><td>
<ul><li>0 = file system tidak akan di backup (melalui perintah dump).</li>
<li>1 = file system akan dibackup.</li>
<li>2 = akan dibackup hari berikutnya.</li>
</ul>
</td><td>backup utility. defaultnya 0. berarti tidak diperlukan untuk mem-backup partisi tersebut<br>
NB: Untuk Linux ddengan kernel di atas 2.2, parameter ini tidak digunakan, jadi hanya sebagai kompabilitas saja
</td></tr>
<tr valign='top'><td>6</td><td>pass</td><td>
<ul>
<li>0 = Tidak diperiksa</li>
<li>1 = Periksa untuk partisi root</li>
<li>2 = Periksa untuk partisi selain root.</li>
</ul>
</td><td>filesystem check utility. defaultnya 0. berarti fsck tidak perlu mengecek partisi tersebut.<br>
Pastikan untuk device yang berupa folder sharing, CDROM, dan sebagainya yang bukan merupakan HDD Kita (atau yang dimounting dengan read only) isikan dengan 0. Karena tidak ada gunanya kita memeriksa semua device tersebut.
</td></tr>
</tbody>
</table>
