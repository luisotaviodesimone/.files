# Check if flatpak is installed
if ! command -v flatpak &> /dev/null
then
    echo "flatpak could not be found"
    exit
fi

# Install apps

flathub=(
  com.spotify.Client
  com.google.Chrome
  rest.insomnia.Insomnia
  com.visualstudio.code
  com.discordapp.Discord
  io.github.mimbrero.WhatsAppDesktop
  )

for app in "${flathub[@]}"
do
    echo $app
    # flatpak install flathub "$app" -y
done