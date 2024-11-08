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
      mkHost = path: system: {
        name = builtins.baseNameOf path;
        value = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            # Path to host's entrypoint
            ./hosts/${path}
            # Disko manages disk configuration
            disko.nixosModules.disko
          ];
        };
      };
    in
    {
      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/cronos" "x86_64-linux")
        (mkHost "workstations/hyperion" "x86_64-linux")
      ];
    };
}
