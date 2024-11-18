{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko.url = "github:nix-community/disko/v1.9.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    haumea.url = "github:nix-community/haumea/v0.2.2";
    haumea.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      haumea,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

      custom =
        system:
        haumea.lib.load {
          src = ./lib;
          inputs = {
            lib = nixpkgs.lib;
            pkgs = nixpkgs.legacyPackages.${system};
          };
        };

      mkHost = path: system: {
        name = builtins.baseNameOf path;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Host-specific (including disk) configuration
            ./hosts/${path}
            disko.nixosModules.disko
            # NixOS configuration
            ./nixosModules
            # Home Manager configuration
            ./homeManagerModules
            home-manager.nixosModules.home-manager
          ];
          specialArgs = {
            custom = custom system;
          };
        };
      };
    in
    {
      packages = forEachSystem (system: import ./pkgs { pkgs = nixpkgs.legacyPackages.${system}; });
      formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      homeConfigurations = forEachSystem (
        system:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./homeManagerModules ];
          specialArgs = {
            custom = custom system;
          };
        }
      );

      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/cronos" "x86_64-linux")
        (mkHost "workstations/hyperion" "x86_64-linux")
      ];
    };
}
