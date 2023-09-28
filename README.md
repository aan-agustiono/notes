<h4>Docker</h4>
<pre>
sudo apt-get update -y && sudo apt upgrade -y 
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https 
</pre>
<i>Ubuntu version</i>
<pre>
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
</pre>
<i>Debian version</i>
<pre>
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
</pre>
<i>Installations</i>
<pre>
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y 
sudo usermod -aG docker $USER && newgrp docker  
</pre>

<i>MASALAH OLD apt-key</i>
<pre>  
================== CATATAN PENTING MASALAH OLD apt-key ========================
wget -O - http://download.cloudstack.org/release.asc |sudo apt-key add -
mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/
===============================================================================  
</pre>



## Index Notes

#### [Clouds]()
| Project | Docum | 

#### [Database]()

#### [DevOpsSec]()

#### [Docs]()

#### [Driver]()

#### [Kubernetes]()

#### [Linux]()

#### [Networking]()

#### [Storage]()

#### []()





