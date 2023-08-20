
#### Step 1 - Install dependencies
```
apt-get -y update && apt-get -y upgrade
apt-get -y install bridge-utils openssh-server openntpd genisoimage python3-pip mysql-server nfs-kernel-server qemu-kvm libvirt-bin
```
#### Step 2 - Configure the network
Note: Replace IP addresses according to your network configuration.
Rename the <code>/etc/netplan/00-installer-config.yaml</code> file to <code>/etc/netplan/original-00-installer-config.yaml</code> to save it as a backup.
```
mv /etc/netplan/00-installer-config.yaml /etc/netplan/original-00-installer-config.yaml
```
Use your preferred editor and open a new file <code>/etc/netplan/00-installer-config.yaml</code>. Add the content below to the file.
```
network:
    version: 2
    renderer: networkd
    ethernets:
        ens3:
            dhcp4: no
            dhcp6: no

    bridges:
        cloudbr0:
            interfaces: [ens3]
            dhcp4: no
            dhcp6: no
            addresses: [192.168.122.10/24]
            gateway4: 192.168.122.1
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
```
Apply the changes. <code>netplan --debbug apply</code><br>
Associate the IP address with the hostname.
```
IP="192.168.122.10"
HOSTNAME=$(hostname -f)
sed -i -e "s/^127.0.1.1.*/$IP $HOSTNAME/" /etc/hosts
```
Allow SSH access with root.
```
sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/" /etc/ssh/sshd_config
```


