## Access mariadb or Mysql server from LAN

### - Step 01 (edit file configuration on '/etc/mysql/my.cnf' )
```
bind-address = 127.0.0.1  >  bind-address = 0.0.0.0
skip-networking           >  #skip-networking
```

### - step 02
#### Create user and password
```
mysql> CREATE USER ‘username’@’%’ IDENTIFIED BY ‘password’;
mysql> ON databasename.*
mysql> TO ‘username’@’%’
mysql> IDENTIFIED BY ‘newpassword’;
mysql> flush privileges;
```
#### Full access remote
```
mysql> CREATE USER ‘username’@’%’
mysql> IDENTIFIED BY ‘password’;
mysql> GRANT ALL ON *.* TO ‘username’@’%’;
mysql> flush privileges;
```
or
```
mysql> GRANT ALL PRIVILEGES ON *.* TO ‘username’@’%’
mysql> IDENTIFIED BY ‘password’
mysql> WITH GRANT OPTION;
mysql> flush privileges;
```

### - step 03 (Restart)
#### CentOS
`$ sudo systemctl restart mysql`
#### Fedora
`$ service mysqld restart`
#### Debian/Ubuntu
`$ sudo service mysql restart`
#### If your service is named “mysqld”, try this:
`$ sudo /etc/init.d/mysql restart`

## Simple ways
```
CREATE USER 'ants'@'%'IDENTIFIED BY 'scythe!';
GRANT ALL ON *.* TO 'ants'@'%';
flush privileges;
```
