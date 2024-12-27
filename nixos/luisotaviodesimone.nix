{ lib, config, pkgs, ... }:

let
  cfg = config.main-user;
in
{

  options.main-user = {
    enable = lib.mkEnableOption "enable user module";
    userName = lib.mkOption {
      default = "luisotaviodesimone";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {

    programs.zsh = {
      enable = true;

      shellAliases = {
        update = "sudo nixos-rebuild switch";
      };
    };

    users.users.${cfg.userName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
      description = "the main user";
      shell = pkgs.zsh;
      packages = with pkgs; [
        tree
        starship
        bat
        libgcc
        btop
        gnumake
        gcc
        fzf
        dig
      ];
    };
  };

}
