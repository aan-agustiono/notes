#### Install minikube step on fresh OS (Ubuntu)
```
sudo apt-get update -y && sudo apt upgrade -y 
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https 
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | 
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y 
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
sudo cp minikube-linux-amd64 /usr/local/bin/minikube 
sudo chmod 755 /usr/local/bin/minikube && minikube version  
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl  
chmod +x ./kubectl 
sudo mv ./kubectl /usr/local/bin/kubectl 
sudo usermod -aG docker $USER && newgrp docker
minikube start --driver=docker
```

#### All in one script
```
sudo apt-get update -y && sudo apt upgrade -y && sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https && sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y && wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo cp minikube-linux-amd64 /usr/local/bin/minikube && sudo chmod 755 /usr/local/bin/minikube && minikube version && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl && sudo usermod -aG docker $USER && newgrp docker &&  minikube start --driver=docker
```
<hr>
#### Detailed step installations

We chose minikube based on these requirements. We will also need an Ingress to distribute the traffic through the replicas. From the outside it will look like a single entry point leading to multiple pods. 

We will use the NGINX Ingress controller as the Ingress and Docker as a driver to avoid overhead and virtualization consequences.


#### 01.Install kubectl
First of all, you need to install kubectl — a Kubernetes command-line tool.

- methode curl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
```
-- install
`sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`

- methode snap
`snap install kubectl --classic`
- methode repo (apt, yum n etc)

- cek installations
`kubectl version --client`


#### 02.Install a hypervisor or Docker
minikube enables you to use a hypervisor to create and manage virtual machines on a local host. You can use KVM or VirtualBox for Linux.


#### 03.Install minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
start minikube
`minikube start --vm-driver=docker`

to use minikube with Docker. To make Docker the default driver, use
`minikube config set driver docker`

If you want to change the driver, you should stop minikube first (see below).

Check that minikube is running correctly by requesting
`minikube status`

You should get a similar output:
```
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```
When you are done working with minikube, stop the cluster with
`minikube stop`

#### 04.Install NGINX
To enable the NGINX Ingress Controller (minikube must be started), run
```
minikube addons enable ingress
```
Check that NGINX is running:
```
kubectl get pods -n ingress-nginx
```
You should see something like this:

```
NAME READY STATUS RESTARTS AGE

ingress-nginx-admission-create-p8fsk 0/1 Completed 0 53s
ingress-nginx-admission-patch-z6x9c 0/1 Completed 1 53s
ingress-nginx-controller-755dfbfc65-229wz 1/1 Running 0 53s
```



