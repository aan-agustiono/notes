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




# All in one script
sudo apt-get update -y && sudo apt upgrade -y && sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release apt-transport-https && sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y && wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && sudo cp minikube-linux-amd64 /usr/local/bin/minikube && sudo chmod 755 /usr/local/bin/minikube && minikube version && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl && sudo usermod -aG docker $USER && newgrp docker &&  minikube start --driver=docker
