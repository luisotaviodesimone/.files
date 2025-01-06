{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Disk setup
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; inherit self; };
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./hardware-configuration.nix
        ./disko-config.nix
        ./configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}

