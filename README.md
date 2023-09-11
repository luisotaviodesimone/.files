# .files

This is the repository to host my automatic initial configuration to my Windows developing environment

## Setup
1. First you should set you execution policy to `Bypass` in order to run the script:
```

Set-ExecutionPolicy Bypass

```
2. Next, one thing that you should know is that in order to make the terminal look pretty with the oh-my-posh icons 💅, the NerdFonts are required. I included the fonts installation script execution in the `first_configs.ps1` file so you don't have to bother installing them. I particularly use the `CascadiaCode` font (patched as Caskaydia Cove), but you can choose yours [here](https://github.com/ryanoasis/nerd-fonts/releases).

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

OBS: In order to use the Nerd fonts and the themes you should configure your Windows Terminal (I included my configurations in the `settings.json` file)

1. If you want to install my personal tools, `cd` into the `~\.files` directory and you can run `. .\personal_tools.ps1`

---

## Also...

- Don't forget to check out my personal cli tool [here](https://github.com/luisotaviodesimone/my-powershell-cli) and have been migrating it to its Go version [here](https://github.com/luisotaviodesimone/my-go-cli)
