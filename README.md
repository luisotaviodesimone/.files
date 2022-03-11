# .files

This is the repository to host my automatic initial configuration to my Windows developing environment

## Setup
1. First you should set you execution policy to `Bypass` in order to run the script:
```

Set-ExecutionPolicy Bypass

```
2. Next, don't forget to go [here](https://github.com/ryanoasis/nerd-fonts/releases) to download the NerdFonts and install it so that the terminal looks pretty with the oh-my-posh icons 💅. I particularly use the `Hack NerdFonts`

3. After that, since it is a automatic setup, if your shell is PowerShell, by default in Windows 10, the 5.1 version, you should be able to run the `first_configs.ps1` script to install some initial dev tools by running the following command:
```

iex ((new-object net.webclient).DownloadString('https://raw.github.com/luisotaviodesimone/.files/master/first_configs.ps1'))

```
4. If you want to install my personal tools cd into the `.files` directory and you can run `. ./personal_tools.ps1`
