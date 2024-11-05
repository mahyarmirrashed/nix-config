{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    { nixpkgs
    , home-manager
    , ...
    }:
    let
      mkHost = system: role: name: {
        inherit name;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            home-manager.nixosModules.home-manager

            ./hosts/${role}/${name}/default.nix
          ];
        };
      };
    in
    {
      nixosConfigurations = builtins.listToAttrs [
        (mkHost "x86_64-linux" "workstation" "cronos")
      ];
    };
}
