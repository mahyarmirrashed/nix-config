{ ... }:
{
  imports = [
    ./common.nix
    ./options.nix
    ./stylix.nix

    ./desktop
    ./security
    ./users
    ./virtualisation
  ];
}
