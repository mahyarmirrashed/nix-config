{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, disko, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

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
      packages = forEachSystem (system: import ./pkgs { pkgs = nixpkgs.legacyPackages.${system}; });

      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/cronos" "x86_64-linux")
        (mkHost "workstations/hyperion" "x86_64-linux")
      ];
    };
}
