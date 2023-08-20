### Remove snap repo from Ubuntu
```
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service
sudo snap list
sudo snap remove firefox
sudo snap remove gnome-3-38-2004
sudo snap remove gtk-common-themes
sudo snap remove core20
sudo snap remove bare
sudo snap remove snapd
sudo snap list
sudo apt autoremove --purge snapd
rm -rf ~/snap/
```
