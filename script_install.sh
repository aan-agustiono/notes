### DOCKER NODEJS & JAVA
#   CT Setting
echo "Set disable_coredump false" >> /etc/sudo.conf

#   === setup repo ===
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#   === docker install ===
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

#   === INSTALL JAVA ===
sudo apt install default-jdk -y

#   === INSTALL NODEJS ===
sudo apt update
sudo apt install nodejs npm -y


#   All in one script command :
sudo apt update && sudo apt-get install -y ca-certificates curl gnupg lsb-release && sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y && sudo apt install default-jdk -y && sudo apt update && sudo apt install nodejs npm -y && sudo apt update && sudo apt upgrade -y
