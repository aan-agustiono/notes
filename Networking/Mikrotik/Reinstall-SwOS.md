# Re-Install SwOS (RB250GS & RB260GGSP)

[Artikel :Reinstall SwOS (RB250GS & RB260GS/GSP)](https://mikrotik.co.id/artikel/133/)

Jika kita memliki sebuah switch RB250GS dan RB260GS/GSP dan mengalami masalah pada sistem operasinya misal karena Kernel Panic, lalu bagaimana cara memperbaikinya? Mungkin jika pada router kita bisa melakukan reinstall dengan menggunakan netinstall, lalu apakah pada switch bisa di reinstall?

Seperti yang kita tahu switch RB250GS dan RB260GS/GSP menggunakan sistem operasi SwOS. Untuk cara remote sistem operasinya pun juga berbeda dengan RouterOS, jika pada RouterOS bisa di remote melalui aplikasi winbox, namun untuk SwOS hanya bisa di remote melalui web browser karena tampilan untuk graphic interface merupakan web based. Apabila kita melakukan remote menggunakan winbox maka akan secara otomatis di direct ke web browser.

Nah, berkaitan dengan tema kali ini apabila melihat sekilas perbedaan sistem operasi yang digunakan RB260GS/GSP yaitu SwOS tetap bisa di install ulang, namun untuk langkah-langkahnya tidak sama dengan cara install ulang RouterOS. Berbeda dengan RouterOS yang bisa menggunakan aplikasi netinstall untuk install ulang sistem operasi, pada SwOS ini kita bisa install ulang menggunakan BOOTP (Bootstrap Protocol).

BOOTP merupakan sebuah protokol yang dapat membuat sebuah perangkat dapat menginisialisasi dirinya pada sebuah jaringan (RFC951). Untuk dapat memanfaatkan BOOTP pada reinstall SwOS, kita membutuhkan sebuah perangkat router dengan mengaktifkan DHCP Server dan TFTP Server. Pada contoh implementasi kali ini kita menggunakan router RB450G dan switch RB260GSP.

