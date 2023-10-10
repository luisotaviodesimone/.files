# Check if flatpak is installed
if ! command -v flatpak &> /dev/null
then
    echo "flatpak could not be found"
    exit
fi

# Install apps

flathub=(
  com.google.Chrome
  com.visualstudio.code
  com.spotify.Client
  rest.insomnia.Insomnia
  com.discordapp.Discord
  )

for app in "${flathub[@]}"
do
    flatpak install flathub "$app" -y
done
