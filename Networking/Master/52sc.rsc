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

/ip/address/add address=1.1.10.2/32 interface=lo network=1.1.10.2
/ip/address/add address=192.168.185.254/24 interface=ether2 network=192.168.185.0
/ip/address/add address=192.168.191.1/24 interface=ether3 network=192.168.191.0
/ip/address/add address=192.168.192.1/24 interface=ether4 network=192.168.192.0

/ip/pool/add name=pool191 ranges=192.168.191.11-192.168.191.254
/ip/pool/add name=pool192 ranges=192.168.192.11-192.168.192.254

/ip/dhcp-server/network add address=192.168.191.0/24 dns-server=192.168.191.1 gateway=192.168.191.1
/ip/dhcp-server/network add address=192.168.192.0/24 dns-server=192.168.192.1 gateway=192.168.192.1

/ip/dhcp-server/add address-pool=pool191 interface=ether3 name=DHCP191
/ip/dhcp-server/add address-pool=pool192 interface=ether4 name=DHCP192

/ip/firewall/address-list/add address=192.168.191.0/24 list=i-bgp
/ip/firewall/address-list/add address=192.168.192.0/24 list=i-bgp

/ip/route/add dst-address=1.1.10.1/32 gateway=192.168.185.1
/ip/route/add blackhole disabled=no dst-address=192.168.191.0/24
/ip/route/add blackhole disabled=no dst-address=192.168.192.0/24

/routing/bgp/template add as=65510 disabled=no name=as65510 router-id=1.1.10.2

/routing/bgp/connection add disabled=no local.role=ibgp name=i-bgp output.network=i-bgp remote.address=1.1.10.1/32 .as=65510 templates=as65510
