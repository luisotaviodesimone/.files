#!/usr/bin/zsh

# Check if flatpak is installed
if ! command -v flatpak &> /dev/null
then
    echo "flatpak could not be found"
    exit
fi

# Install apps

flathub=(
  com.spotify.Client
  rest.insomnia.Insomnia
  com.discordapp.Discord
  com.authy.Authy
  io.dbeaver.DBeaverCommunity
  )

for app in "${flathub[@]}"
do
    flatpak install flathub "$app" -y
done
