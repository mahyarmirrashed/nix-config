{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    disko.url = "github:nix-community/disko/v1.9.0";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    haumea.url = "github:nix-community/haumea/v0.2.2";
    haumea.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-24.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      haumea,
      stylix,
      flake-utils,
      ...
    }@inputs:
    let
      custom = haumea.lib.load {
        src = ./lib;
        loader = [
          (haumea.lib.matchers.nix haumea.lib.loaders.scoped)
          (haumea.lib.matchers.extension "png" haumea.lib.loaders.path)
        ];
        inputs = {
          inherit (nixpkgs) lib;
        };
      };

      mkHost = path: {
        name = builtins.baseNameOf path;
        value = nixpkgs.lib.nixosSystem rec {
          modules = [
            # Host-specific (including disk) configuration
            ./hosts/${path}
            disko.nixosModules.disko
            # NixOS configuration
            ./nixosModules
            # Home Manager configuration
            ./homeManagerModules
            home-manager.nixosModules.home-manager
            { home-manager.extraSpecialArgs = specialArgs; }
            # Miscellaneous
            stylix.nixosModules.stylix
          ];
          specialArgs = {
            inherit custom;
          };
        };
      };
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixfmt-rfc-style;

        homeConfigurations = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./homeManagerModules ];
          extraSpecialArgs = {
            inherit custom;
          };
        };
      }
    )
    // {
      nixosConfigurations = builtins.listToAttrs [
        (mkHost "workstations/cronos")
        (mkHost "workstations/hyperion")
      ];
    };
}
