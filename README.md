# .files

This is the repository to host my automatic initial configuration to my Windows developing environment

## Setup
1. First you should set you execution policy to `Bypass` in order to run the script:
```

Set-ExecutionPolicy Bypass

```
2. Next, don't forget to go [here](https://github.com/ryanoasis/nerd-fonts/releases) to download the NerdFonts and install it so that the terminal looks pretty with the oh-my-posh icons 💅. I particularly use the `Hack NerdFonts`

3. After that, since it is a automatic setup, you just have to run the following command. But first, you need be sure:

    - That your shell is PowersShell 5.1 version
    - That your running the script on an elevated shell

    With that said, you should be able to run the `first_configs.ps1` script to install some initial dev tools by running the following command:
```

iwr -useb https://raw.github.com/luisotaviodesimone/.files/master/first_configs.ps1 | iex

```
4. Now you can go ahead and, in the Microsoft Store, download:
    - Windows Terminal
    - PowerShell v7.2

5. If you want to install my personal tools cd into the `~\.files` directory and you can run `. .\personal_tools.ps1`
