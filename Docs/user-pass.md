
| TYPE | LOCATIONS | SERVER | APLICATION | IP/HOSTNAME | ACCESS | USERNAME | PASSWORD | 
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| BM | MONITORING |  |  | 172.16.255.96 | http://172.16.255.96:5601 | admin | m45t3rR007 |
| BM | NAS | TrueNAS |  | 172.16.255.251 | http://172.16.255.251 | root | m45t3rR007 |
| BM | PVE-03 | CLOUDS | Proxmox | 172.16.255.4 | https://172.16.255.4 | root | m45t3rR007 |
| VM | PVE-03 | VPN | Pritunl | 172.16.255.50 | https://172.16.255.50:8443/ | root | m45t3rR007 |
| VM | PVE-03 | LDAP | OpenLDAP | 172.16.255.14 | http://172.16.255.14 | admin | m45t3rR007 |
| BM | Management | CloudStack | Apache Cloudstack | cloud-management | http://172.16.25.2:8080/client | admin | m45t3rR007 |
| BM | Management | CloudStack | Apache Cloudstack | cloud-management | https://cloud.indoteam.id/client/ | admin | m45t3rR007 |
| BM | Management | CloudStack | Apache Cloudstack | cloud-management | ssh 172.16.25.2 | root | m45t3rR007 |
| BM | Hypervisor | CloudStack | KVM | kvm-host | ssh 172.16.25.3 | root | m45t3rR007 |
| BM | Hypervisor | CloudStack | KVM | kvm-prod | ssh 172.16.25.10 | root | m45t3rR007 |
| VM | PVE-03 | db-CloudStack | - | support-server | ssh 172.16.25.7 | root | m45t3rR007 |
| VM | PVE-03 | Ceph-Admin | Ceph | ceph-admin | https://172.16.25.8:8443 | admin | m45t3rR007 |
| VM | PVE-03 | Ceph-Admin | Ceph | ceph-admin | ssh 172.16.25.8 | root | m45t3rR007 |
| BM | OSD 1 | CEPH node | Primary Storage | osd1-server | ssh 172.16.25.4 | root | m45t3rR007 |
| BM | OSD 2 | CEPH node | Primary Storage | osd2-server | ssh 172.16.25.5 | root | m45t3rR007 |
| BM | OSD 3 | CEPH node | Primary Storage | osd3-server | ssh 172.16.25.9 | root | m45t3rR007 |
| BM | NFS | NFS | Secondary Storage | secondary-storage | ssh 172.16.25.6 | root | m45t3rR007 |
