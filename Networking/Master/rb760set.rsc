/user/set admin disabled=no password=scythe!
/snmp/set contact=aan.agustiono@gmail.com location=JAKARTA trap-version=2 enabled=yes
/system/identity/set name=RB760iGS
/ip/service/disable telnet    
/ip/service/disable ftp    
/ip/service/disable www

/ip/dhcp-client/add disabled=no interface=ether1 use-peer-ntp=yes use-peer-dns=yes add-default-route=yes
/ip/firewall/nat/add chain=srcnat out-interface=ether1 action=masquerade
/ip/dns/set allow-remote-requests=yes
/system/ntp/client/set enabled=yes


/ip/address/add address=192.168.162.1/24 interface=ether2 disabled=no
/ip/address/add address=192.168.163.1/24 interface=ether3 disabled=no   
/ip/address/add address=192.168.164.1/24 interface=ether4 disabled=no  


/ip/firewall/address-list/add list=bgp_rb760 address=192.168.162.0/24
/ip/firewall/address-list/add list=bgp_rb760 address=192.168.163.0/24 
/ip/firewall/address-list/add list=bgp_rb760 address=192.168.164.0/24

/ip/route/add dst-address=192.168.162.0/24 blackhole 
/ip/route/add dst-address=192.168.163.0/24 blackhole  
/ip/route/add dst-address=192.168.164.0/24 blackhole

/ip/pool/add name=pool162 ranges=192.168.162.11-192.168.162.254 
/ip/pool/add name=pool163 ranges=192.168.163.11-192.168.163.254    
/ip/pool/add name=pool164 ranges=192.168.164.11-192.168.164.254

/ip/dhcp-server/network/add address=192.168.162.0/24 gateway=192.168.162.1 dns-server=192.168.162.1 
/ip/dhcp-server/network/add address=192.168.163.0/24 gateway=192.168.163.1 dns-server=192.168.163.1    
/ip/dhcp-server/network/add address=192.168.164.0/24 gateway=192.168.164.1 dns-server=192.168.164.1

/ip/dhcp-server/add name=DHCP162 interface=ether2 address-pool=pool162
/ip/dhcp-server/add name=DHCP163 interface=ether3 address-pool=pool163
/ip/dhcp-server/add name=DHCP164 interface=ether4 address-pool=pool164




