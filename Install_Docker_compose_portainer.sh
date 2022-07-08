#!/bin/bash

echo -e "\033[31m
 _  _  ____  ____  ____   ___  ____    __    ____  ____  _  _
 ( \( )( ___)(  _ \(  _ \ / __)(  _ \  /__\  (_  _)(  _ \( \/ )
  )  (  )__)  )   / )(_) )\__ \ )(_) )/(__)\  _)(_  )   / \  /
  (_)\_)(____)(_)\_)(____/ (___/(____/(__)(__)(____)(_)\_) (__)
  \033[0m"

echo ""
echo ""


function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you have an active internet..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Yes, You have! Lets do it!."
  else
    error "Oops! You don't. Connect to a wired or wireless internet connection and try again."
  fi
}

check_internet

curl -sSL https://get.docker.com | sh || error "Failed to install Docker."
sudo usermod -aG docker $USER || error "Failed to add user to the Docker usergroup."
sleep 2
echo ""

echo "Installing Docker-Compose.."
sleep 5
echo ""

sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose || error "Failed to download Docker Compose."
sudo chmod +x /usr/local/bin/docker-compose || error "Failed to set permission for Docker Compose"
sleep 3

echo "Installing Portainer.."
sleep 5
echo ""

sudo docker pull portainer/portainer-ce:latest || error "Failed to pull latest Portainer docker image!"
sudo docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest || error "Failed to run Portainer docker image!"
echo""
echo""
echo"Installation Successful"
echo "Please logout/Reboot for the changes to take effect."
