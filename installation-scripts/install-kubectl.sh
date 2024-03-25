# Install dummie packages
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl

# Add kubernetes right repository
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

#Install kubernetes
sudo apt update && sudo apt install kubectl -y

mkdir -p $HOME/.kube/ $HOME/.kube/configs
touch $HOME/.kube/config
sudo chmod go-r ~/.kube/config

