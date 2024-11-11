{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko.url = "github:nix-community/disko/v1.9.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

      homeManagerSettings = {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;
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
            homeManagerSettings
          ];
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
        }
      );

      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/cronos" "x86_64-linux")
        (mkHost "workstations/hyperion" "x86_64-linux")
      ];
    };
}
