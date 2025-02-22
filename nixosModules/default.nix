{ ... }:
{
  imports = [
    ./common.nix
    ./options.nix
    ./stylix.nix

    ./desktop
    ./users
    ./virtualisation
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
}
