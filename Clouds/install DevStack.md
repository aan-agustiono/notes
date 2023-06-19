## Source <a href="https://kifarunix.com/deploy-openstack-using-devstack-on-ubuntu/">DevStack Ubuntu2204</a>

`sudo apt update -y`<br>
`sudo apt upgrade -y && sudo systemctl reboot -i`<br>

`sudo useradd -m -s /bin/bash cloud-admin`<br>
`sudo visudo -f /etc/sudoers.d/cloud-admin`<br>

#### Isi File
```
cloud-admin ALL = NOPASSWD: ALL
```

`sudo -u cloud-admin -i`<br>
`git clone https://opendev.org/openstack/devstack`<br>
`ls -1 devstack`<br>

`cd devstack`<br>
`vim local.conf`<br>

#### Isi File
```
[[local|localrc]]
ADMIN_PASSWORD=YourPasswordHere
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD

HOST_IP=192.168.56.124
```

`./stack.sh`<br>


