sudo sed -i 's/:wa"/:wa:en"/' /usr/lib/x86_64-linux-gnu/gtk-3.0/3.0.0/immodules.cache 
sudo sed -i 's/:wa"/:wa:en"/' /usr/lib/x86_64-linux-gnu/gtk-2.0/2.10.0/immodules.cache 
sudo sed -i /usr/share/X11/locale/en_US.UTF-8/Compose -e 's/ć/ç/g' -e 's/Ć/Ç/g'
sudo echo -e "GTK_IM_MODULE=cedilla\nQT_IM_MODULE=cedilla" | sudo tee -a /etc/environment

