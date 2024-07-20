/user/set admin disabled=no password=scythe!
/snmp/set contact=aan.agustiono@gmail.com location=JAKARTA trap-version=2 enabled=yes
/system/identity/set name=RB750GR3
/ip/service/disable telnet    
/ip/service/disable ftp    
/ip/service/disable www

/ip/dhcp-client/add disabled=no interface=ether1 use-peer-ntp=yes use-peer-dns=yes add-default-route=yes
/ip/firewall/nat/add chain=srcnat out-interface=ether1 action=masquerade
/ip/dns/set allow-remote-requests=yes
/system/ntp/client/set enabled=yes


/ip/address/add address=192.168.152.1/24 interface=ether2 disabled=no
/ip/address/add address=192.168.153.1/24 interface=ether3 disabled=no   
/ip/address/add address=192.168.154.1/24 interface=ether4 disabled=no  


/ip/firewall/address-list/add list=bgp_rb750 address=192.168.152.0/24
/ip/firewall/address-list/add list=bgp_rb750 address=192.168.153.0/24 
/ip/firewall/address-list/add list=bgp_rb750 address=192.168.154.0/24

/ip/route/add dst-address=192.168.152.0/24 blackhole 
/ip/route/add dst-address=192.168.153.0/24 blackhole  
/ip/route/add dst-address=192.168.154.0/24 blackhole

/ip/pool/add name=pool152 ranges=192.168.152.11-192.168.152.254 
/ip/pool/add name=pool153 ranges=192.168.153.11-192.168.153.254    
/ip/pool/add name=pool154 ranges=192.168.154.11-192.168.154.254

/ip/dhcp-server/network/add address=192.168.152.0/24 gateway=192.168.152.1 dns-server=192.168.152.1 
/ip/dhcp-server/network/add address=192.168.153.0/24 gateway=192.168.153.1 dns-server=192.168.153.1    
/ip/dhcp-server/network/add address=192.168.154.0/24 gateway=192.168.154.1 dns-server=192.168.154.1

/ip/dhcp-server/add name=DHCP152 interface=ether2 address-pool=pool152
/ip/dhcp-server/add name=DHCP153 interface=ether3 address-pool=pool153
/ip/dhcp-server/add name=DHCP154 interface=ether4 address-pool=pool154

