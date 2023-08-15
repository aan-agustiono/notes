<pre>sudo snap install microceph</pre>
<pre>sudo microceph cluster bootstrap</pre>
<pre>sudo microceph.ceph status</pre>

<pre>
sudo microceph.ceph osd crush rule rm replicated_rule
sudo microceph.ceph osd crush rule create-replicated single default osd
</pre>
<pre>
sudo microceph disk add /dev/sd[x] --wipe
</pre>
Repeat for each disk you would like to use as an OSD on that node, 
and additionally on the other nodes in the cluster. Cluster status can be verified using:
<pre>
sudo microceph.ceph status
sudo microceph.ceph osd status
</pre>

<pre>
microceph.ceph config set mgr mgr/dashboard/ssl false
microceph.ceph mgr module enable dashboard
echo -n "p@ssw0rd" > /var/snap/microceph/current/conf/password.txt
microceph.ceph dashboard ac-user-create -i /etc/ceph/password.txt admin administrator
rm /var/snap/microceph/current/conf/password.txt  
</pre>


#### Reff
- <a href="https://ubuntu.com/ceph/install">ubuntu.com/ceph/install</a>
- <a href="https://discuss.linuxcontainers.org/t/introducing-microceph/15457/42?page=3">Add new user</a>
