# Install dummie packages
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl

# Add kubernetes right repository
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

#Install kubernetes
sudo apt update && sudo apt install kubectl -y

mkdir -p $HOME/.kube/ $HOME/.kube/configs
touch $HOME/.kube/config
sudo chmod go-r ~/.kube/config

# Install Kubernetes related tools

# Get kubectl neat latest release
curl -s https://api.github.com/repos/itaysk/kubectl-neat/releases/latest \
| jq '.assets[] | select(.name=="kubectl-neat_linux_amd64.tar.gz") | .browser_download_url' -r \
| wget -i -

mkdir -p ./kubectl-neat_linux_amd64 && tar -xzf kubectl-neat_linux_amd64.tar.gz -C ./kubectl-neat_linux_amd64

mv ./kubectl-neat_linux_amd64/kubectl-neat $HOME/.local/bin

rm -r ./kubectl-neat_linux_amd64 ./kubectl-neat_linux_amd64.tar.gz

# Get kubeconform latest release
curl -s https://api.github.com/repos/yannh/kubeconform/releases/latest \
| jq '.assets[] | select(.name=="kubeconform-linux-amd64.tar.gz") | .browser_download_url' -r \
| wget -i -

tar -xzf kubeconform-linux-amd64.tar.gz

mv ./kubeconform $HOME/.local/bin

rm -r ./kubeconform-linux-amd64.tar.gz LICENSE

