{
  description = "Mahyar's Nix configurations.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
  };

  outputs = { nixpkgs, ... }:
    let
      mkHost = role: name:
        let
          hostConfig = import ./hosts/${role}/${name}/default.nix;
          system = hostConfig.system or throw "System attribute missing for ${name} (${role}).";
        in
        {
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
        (mkHost "workstation" "cronos")
      ];
    };
}
