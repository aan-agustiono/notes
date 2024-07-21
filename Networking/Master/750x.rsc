/user/set admin disabled=no password=scythe!
/snmp/set contact=aan.agustiono@gmail.com location=JAKARTA trap-version=2 enabled=yes
/system/identity/set name=RB750
/ip/service/disable telnet    
/ip/service/disable ftp    
/ip/service/disable www

/ip/dhcp-client/add disabled=no interface=ether1 use-peer-ntp=yes use-peer-dns=yes add-default-route=yes
/ip/firewall/nat/add chain=srcnat out-interface=ether1 action=masquerade
/ip/dns/set allow-remote-requests=yes
/system/ntp/client/set enabled=yes

/ip/address/add address=1.1.10.1 interface=lo network=1.1.10.1
/ip/address/add address=192.168.185.1/24 interface=ether2 network=192.168.185.0
/ip/address/add address=192.168.186.1/24 interface=ether3 network=192.168.186.0
/ip/address/add address=192.168.187.1/24 interface=ether4 network=192.168.187.0

/ip/pool/add name=pool186 ranges=192.168.186.11-192.168.186.254
/ip/pool/add name=pool187 ranges=192.168.187.11-192.168.187.254

/ip/dhcp-server/network/add address=192.168.186.0/24 dns-server=192.168.186.1 gateway=192.168.186.1
/ip/dhcp-server/network/add address=192.168.187.0/24 dns-server=192.168.187.1 gateway=192.168.187.1

/ip/dhcp-server/add address-pool=pool186 interface=ether3 name=DHCP186
/ip/dhcp-server/add address-pool=pool187 interface=ether4 name=DHCP187

/ip/firewall/address-list/add address=192.168.186.0/24 list=i-bgp
/ip/firewall/address-list/add address=192.168.187.0/24 list=i-bgp

/ip/route/add dst-address=1.1.10.2/32 gateway=192.168.185.254
/ip/route/add blackhole disabled=no dst-address=192.168.186.0/24
/ip/route/add blackhole disabled=no dst-address=192.168.187.0/24

/routing/bgp/template/add as=65510 disabled=no name=as65510 router-id=1.1.10.1

/routing/bgp/connection/add as=65510 disabled=no local.role=ibgp name=i-bgp output.network=i-bgp remote.address=1.1.10.2/32 .as=65510 router-id=1.1.10.1 routing-table=main templates=as65510
