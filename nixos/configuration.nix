# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./luisotaviodesimone.nix
    ];

  # Configure user
  main-user.enable = true;
  main-user.userName = "luisotaviodesimone";

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "luisotaviodesimone" = import ./home.nix;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sokka"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };

    desktopManager = {
      xterm.enable = true;
      xfce.enable = false;
    };

    displayManager.lightdm.enable = false;
  };

  virtualisation.docker.enable = true;

  environment = {
    systemPackages = with pkgs; [
      neovim
      nodejs
      git
      ripgrep
      wget
      libgcc
      fzf
    ];
    shellInit =
      ''
        if [ -f ~/.bashrc ]; then
          source ~/.bashrc
        fi
      '';
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Links this only file from the resulting system (after a 'nixos-rebuild') to /run/current-system/configuration.nix
  system.copySystemConfiguration = false;

  system.stateVersion = "24.05"; # Did you read the comment?

}

