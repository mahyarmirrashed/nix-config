{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, disko, ... }:
    let
      nixosHosts = [
        {
          path = ./hosts/workstations/cronos;
          system = "x86_64-linux";
        }
        {
          path = ./hosts/workstations/hyperion;
          system = "x86_64-linux";
        }
      ];
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = builtins.baseNameOf host.path;
          value = nixpkgs.lib.nixosSystem {
            system = host.system;
            modules = [
              host.path
              disko.nixosModules.disko
            ];
          };
        }) nixosHosts
      );
    };
}
