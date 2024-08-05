#!/usr/bin/bash

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Make possible to user docker without sudo
if getent group docker | grep -q "$USER"; then
echo -e "$RED User '$(whoami)' is already in group 'docker' $RESET"
else
sudo groupadd docker
sudo usermod -aG docker $USER
fi

mkdir -p ~/.docker/completions
docker completion zsh > ~/.docker/completions/_docker
curl https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_golang > ~/.docker/completions/_golang
