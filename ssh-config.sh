# Use xterm as default shell in other hosts
echo 'Host * \n  Setenv TERM="xterm"' >> ~/.ssh/config
