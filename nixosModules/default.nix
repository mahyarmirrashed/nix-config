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
}
