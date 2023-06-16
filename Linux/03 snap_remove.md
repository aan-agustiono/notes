sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service 

sudo snap list

sudo apt autoremove --purge snapd
rm -rf ~/snap/
