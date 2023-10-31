## Step 01 - Suuport Tools
```
apt install openntpd openssh-server sudo vim htop tar gnupg default-jdk maven
```

## Step 02 - Add repository
```
-----------------------------  UBUNTU  -----------------------------------
mkdir -p /etc/apt/keyrings
wget -O- https://download.cloudstack.org/release.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cloudstack.gpg > /dev/null

echo deb [signed-by=/etc/apt/keyrings/cloudstack.gpg] https://download.cloudstack.org/ubuntu $(lsb_release -s -c) 4.18 > /etc/apt/sources.list.d/cloudstack.list
--------------------------------------------------------------------------

------------------------------  DEBIAN  -----------------------------------
mkdir -p /etc/apt/keyrings
wget -O- http://packages.shapeblue.com/release.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cloudstack.gpg > /dev/null

echo deb [signed-by=/etc/apt/keyrings/cloudstack.gpg] http://packages.shapeblue.com/cloudstack/upstream/debian/4.18 / > /etc/apt/sources.list.d/cloudstack.list 
---------------------------------------------------------------------------
```
## Step 03 - Install Management Server
```
apt update && apt-get install mysql-server cloudstack-management cloudstack-usage
```

## Step 04 - Configurations

Create new file at `/etc/mysql/mysql.conf.d/cloudstack.cnf`
```
server_id = 1
sql-mode="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION,ERROR_FOR_DIVISION_BY_ZERO,NO_ZERO_DATE,NO_ZERO_IN_DATE,NO_ENGINE_SUBSTITUTION"
innodb_rollback_on_timeout=1
innodb_lock_wait_timeout=600
max_connections=1000
log-bin=mysql-bin
binlog-format = 'ROW'
```

## Step 05 - Create Database
```
cloudstack-setup-databases cloud:password@localhost --deploy-as=root
```

## Step 06 - Running Management cloudstack
```
cloudstack-setup-management
systemctl status cloudstack-management
tail -f /var/log/cloudstack/management/management-server.log
```
