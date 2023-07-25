Source = '<a href="https://open5gs.org/open5gs/docs/guide/01-quickstart/">open5gs.org install mongodb</a>'
### Import the public key used by the package management system.
<pre>
$ sudo apt update
$ sudo apt install gnupg
$ curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
</pre>
Create the list file <code>/etc/apt/sources.list.d/mongodb-org-7.0.list</code> for your version of Ubuntu.

### On ubuntu 22.04 (Jammy)
<pre>
$ echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
</pre>
### Install the MongoDB packages.
<pre>
$ sudo apt update
$ sudo apt install -y mongodb-org
$ sudo systemctl start mongod (if '/usr/bin/mongod' is not running)
$ sudo systemctl enable mongod (ensure to automatically start it on system boot)
</pre>
