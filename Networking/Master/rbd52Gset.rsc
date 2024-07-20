/user/set admin disabled=no password=scythe!
/snmp/set contact=aan.agustiono@gmail.com location=JAKARTA trap-version=2 enabled=yes
/system/identity/set name=RBD52G
/ip/service/disable telnet    
/ip/service/disable ftp    
/ip/service/disable www

/ip/dhcp-client/add disabled=no interface=ether1 use-peer-ntp=yes use-peer-dns=yes add-default-route=yes
/ip/firewall/nat/add chain=srcnat out-interface=ether1 action=masquerade
/ip/dns/set allow-remote-requests=yes
/system/ntp/client/set enabled=yes

/ip/address/add address=192.168.155.1/24 interface=ether2 network=192.168.155.0
/ip/address/add address=192.168.156.1/24 interface=ether3 network=192.168.156.0
/ip/address/add address=192.168.157.1/24 interface=ether4 network=192.168.157.0

/ip/pool/add name=pool155 ranges=192.168.155.11-192.168.155.254
/ip/pool/add name=pool156 ranges=192.168.156.11-192.168.156.254
/ip/pool/add name=pool157 ranges=192.168.157.11-192.168.157.254

/ip dhcp-server add address-pool=pool155 interface=ether2 name=dhcp155
/ip dhcp-server add address-pool=pool156 interface=ether3 name=dhcp156
/ip dhcp-server add address-pool=pool157 interface=ether4 name=dhcp157

/ip dhcp-server network add address=192.168.155.0/24 dns-server=192.168.155.1 gateway=192.168.155.1
/ip dhcp-server network add address=192.168.156.0/24 dns-server=192.168.156.1 gateway=192.168.156.1
/ip dhcp-server network add address=192.168.157.0/24 dns-server=192.168.157.1 gateway=192.168.157.1

/system note set show-at-login=no
