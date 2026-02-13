mkdir -p ~/.local/completions/
kubectl completion zsh > ~/.local/completions/_kubectl
helm completion zsh > ~/.local/completions/_helm
starship completions zsh > ~/.local/completions/_starship
k3d completion zsh > ~/.local/completions/_k3d
lods completion zsh > ~/.local/completions/_lods
docker completion zsh > ~/.local/completions/_docker
glab completion -s zsh > ~/.local/completions/_glab
uvx --generate-shell-completion zsh > ~/.local/completions/_uvx
uv generate-shell-completion zsh > ~/.local/completions/_uv
mise completion zsh > ~/.local/completions/_mise
opencode completion > ~/.local/completions/_opencode
