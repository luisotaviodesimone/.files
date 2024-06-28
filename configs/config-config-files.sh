mkdir -p ~/.config

ln -sf $DOT_FILES_DIR/.config/* ~/.config/

# Configure default dark theme
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
echo "[Settings]\ngtk-application-prefer-dark-theme = true" >> ~/.config/gtk-3.0/settings.ini
