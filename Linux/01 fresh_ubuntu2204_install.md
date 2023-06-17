Step 01 - Install OS
Step 02 - add ethernet config
```
# /etc/sysctl.conf
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

`sudo sysctl -p`  "For running". 

Step 03 - Remove snap & econfigure snap
```
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service 
sudo snap list
sudo apt autoremove --purge snapd
rm -rf ~/snap/
```
Step 04 - `sudo apt update` <br>
Step 05 - `sudo apt install nmap vim `<br>
Step -6 - `sudo apt update & apt upgrade`


