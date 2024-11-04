{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = { nixpkgs, ... }:
    let
      mkHost = system: role: name: {
        inherit name;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
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
