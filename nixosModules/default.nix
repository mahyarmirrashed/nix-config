{ ... }:
{
  imports = [
    ./common.nix
    ./networking.nix
    ./options.nix
    ./security.nix
    ./stylix.nix
    ./users.nix
    ./virtualisation.nix

    ./desktop
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
}
