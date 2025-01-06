# Configuring new NixOS machine

## Manually setting the VM

1. Follow the guide for the minimal installation in the [NixOS Manual](https://nixos.org/manual/nixos/stable/#sec-installation-manual)
2. Then, copy all of these files (except `disko-config.nix`) to the `/etc/nixos` directory
3. Use the command `nixos-rebuild switch --flake /etc/nixos#default` with root user privileges

## Using nixos-anywhere
1. First install the nix package manager
2. Run the following command:

    ```shell
    sudo nix run github:nix-community/nixos-anywhere --extra-experimental-features "nix-command flakes" -- --generate-hardware-config nixos-generate-config ./hardware-configuration.nix --flake '.#default' --target-host nixos@<host-ip-here>
    ```
    - Keep in mind the host ip must be set in the machine
