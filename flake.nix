{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs =
    { nixpkgs, ... }:
    let
      nixosHosts = [
        {
          path = ./hosts/workstations/cronos;
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
            modules = [ host.path ];
          };
        }) nixosHosts
      );
    };
}
