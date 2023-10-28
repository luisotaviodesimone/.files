# Use xterm as default shell in other hosts
echo 'Host * \n  SetEnv TERM="xterm"' >> ~/.ssh/config
