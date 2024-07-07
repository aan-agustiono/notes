## Docker Scripts fresh installations
### Ubuntu 22.04
```
sudo apt-get update -y && sudo apt upgrade -y 
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https 
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y 
sudo usermod -aG docker $USER && newgrp docker  
```

### ubuntu 24.04 
```
sudo apt update && sudo apt upgrade -y && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common vim
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER && newgrp docker  
```
Varian `docker-compose` on ubuntu 24.04 `docker compose`.


### Debian
```
sudo apt-get update -y && sudo apt upgrade -y 
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https 
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y 
sudo usermod -aG docker $USER && newgrp docker  
```






## MASALAH OLD apt-key
<pre>  
=========================================================================================
##CARA 01

wget -O - http://download.cloudstack.org/release.asc |sudo apt-key add -
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/

##CARA 02
cd /etc/apt/trusted.gpg.d/
sudo wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/grafana.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

=========================================================================================
</pre>

## Add cloudstack repo for ubuntu
```
-------------------  UBUNTU  -----------------------------------
mkdir -p /etc/apt/keyrings
wget -O- https://download.cloudstack.org/release.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cloudstack.gpg > /dev/null

echo deb [signed-by=/etc/apt/keyrings/cloudstack.gpg] https://download.cloudstack.org/ubuntu $(lsb_release -s -c) 4.18 > /etc/apt/sources.list.d/cloudstack.list
```

## Add cloudstack repo for debian
```
-------------------  DEBIAN  -----------------------------
mkdir -p /etc/apt/keyrings
wget -O- http://packages.shapeblue.com/release.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cloudstack.gpg > /dev/null

echo deb [signed-by=/etc/apt/keyrings/cloudstack.gpg] http://packages.shapeblue.com/cloudstack/upstream/debian/4.18 / > /etc/apt/sources.list.d/cloudstack.list 
```
## Create file .pem from .crt and .key
```
cat server.crt server.key > server.includesprivatekey.pem
```

## Create Apache and PHP 8.2 fresh installations
```
sudo apt install software-properties-common 
sudo add-apt-repository ppa:ondrej/php
sudo apt update && sudo apt install -y apache2 php8.2 php8.2-fpm vim 
sudo a2enmod proxy_fcgi setenvif userdir
sudo a2enconf php8.2-fpm
mkdir ~/public_html
chmod 711 $HOME
chmod 755 ~/public_html
vim ~/public_html/index.html
```


## Index Notes

#### [Favorites Links](fav-url.md)

#### [Clouds]()
| Project | Docum | 

#### [Database](Database/)

#### [DevOpsSec]()

#### [Docs]()

#### [Driver]()

#### [Kubernetes]()

#### [Linux]()

#### [Networking]()

#### [Storage]()

#### []()





