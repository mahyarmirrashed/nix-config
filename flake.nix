{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    disko.url = "github:nix-community/disko/v1.9.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    zenvim.url = "github:mahyarmirrashed/zenvim";
    zenvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      disko,
      stylix,
      zenvim,
      ...
    }:
    let
      supportedSystems = [
        "x86_64-linux"
      ];
      forEachSystem = nixpkgs.lib.genAttrs supportedSystems;

      mkHost = path: {
        name = baseNameOf path;
        value = nixpkgs.lib.nixosSystem {
          modules = [
            # Disk configuration
            disko.nixosModules.disko
            # Host settings
            ./hosts/${path}
            # NixOS modules
            ./nixosModules
            # Miscellaneous
            stylix.nixosModules.stylix
            { nixpkgs.overlays = [ zenvim.overlays.default ]; }
          ];
          specialArgs.self = self;
        };
      };
    in
    {
      formatter = forEachSystem (system: nixpkgs.legacyPackages.${system}.nixfmt);

      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/hyperion")
      ];
    };
}
