## PHP 8 on Debian 11
#### Install (root)
```
apt update
apt -y install lsb-release apt-transport-https ca-certificates 
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

apt update
apt upgrade -y && reboot
apt update
apt search php8.2
apt install apache2 php php8.2 php-fpm php-cgi libapache2-mod-php php-common php-pear php-mbstring
apt update && apt install sudo -y && apt update && apt upgrade -y && reboot
```
#### Activate Userdir
```
root@www:~# a2enmod userdir
Enabling module userdir.
To activate the new configuration, you need to run:
  systemctl restart apache2

root@www:~# systemctl restart apache2
```
#### User Home
```
debian@www:~$ mkdir ~/public_html
debian@www:~$ chmod 711 /home/debian
debian@www:~$ chmod 755 /home/debian/public_html
```
