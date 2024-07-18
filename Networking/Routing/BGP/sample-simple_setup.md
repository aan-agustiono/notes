## A Simple MikroTik RouterOS v7 BGP Config

The setup will have:
```
LAN --- 1.0.0.0/24(eht2[R1]eth1)3.0.0.1 ------ 3.0.0.2(eht2[R2]eth1)2.0.0.0/24 --- LAN 
```

- R1 with AS1 and R2 with AS2
- 1.0.0.0/24 that R1 will advertise
- 2.0.0.0/24 that R2 will advertise
- 3.0.0.0/24 for the point-to-point link between R1 and R2
- 3.0.0.1 for R1 and 3.0.0.2 for R2
- The `ether1` interface for the R1 and R2 point-to-point links
- The `ether2` interface for the internal, to-be-advertised subnet

I will not be doing route filters or IPv6 in this article. I plan to do it in future posts.

### To setup BGP, first set your IP addresses, 
#### R1:
```
/ip address
add address=1.0.0.1/24 interface=ether2 network=1.0.0.0
add address=3.0.0.1/24 interface=ether1 network=3.0.0.0
```
#### R2:
```
/ip address
add address=2.0.0.1/24 interface=ether2 network=2.0.0.0
add address=3.0.0.2/24 interface=ether1 network=3.0.0.0
```
### Then configure the IP address lists, 
#### R1:
```
/ip firewall address-list
add address=1.0.0.0/24 list=bgp-networks
add address=3.0.0.0/24 list=bgp-networks
/ip route
add blackhole dst-address=1.0.0.0/24
```
#### R2:
```
/ip firewall address-list
add address=2.0.0.0/24 list=bgp-networks
/ip route
add blackhole dst-address=2.0.0.0/24
```
### Next, we should configure the default AS. 
#### R1:
```
/routing bgp template set default as=1
```
#### R2:
```
/routing bgp template set default as=2
```
### Finally, configure BGP
#### R1:
```
/routing bgp connection add listen=yes local.role=ebgp name=toR2 output.network=bgp-networks remote.address=3.0.0.2 templates=default
```
#### R2:
```
/routing bgp connection add listen=yes local.role=ebgp name=toR1 output.network=bgp-networks remote.address=3.0.0.1 templates=default
```

### The BGP should now be set, 

#### R1:
```
[admin@MikroTik] > /routing/bgp/connection print
Flags: D - dynamic, X - disabled, I - inactive 
 0   name="toR2" 
     remote.address=3.0.0.2 
     local.default-address=3.0.0.1 .role=ebgp 
     listen=yes routing-table=main templates=default as=1 
     output.network=bgp-networks 
[admin@MikroTik] > /routing bgp ad print
 0 peer=toR1-1 dst=2.0.0.0/24 afi=ip nexthop=3.0.0.2 origin=0 
   as-path=sequence 2
[admin@MikroTik] >
```
#### R2:
```
[admin@MikroTik] > /routing/bgp/connection print
Flags: D - dynamic, X - disabled, I - inactive 
 0   name="toR1" 
     remote.address=3.0.0.1 
     local.default-address=3.0.0.2 .role=ebgp 
     listen=yes routing-table=main templates=default as=2 
     output.network=bgp-networks 
[admin@MikroTik] > /routing bgp ad print
 0 peer=toR1-1 dst=2.0.0.0/24 afi=ip nexthop=3.0.0.2 origin=0 
   as-path=sequence 2 
[admin@MikroTik] >
```
