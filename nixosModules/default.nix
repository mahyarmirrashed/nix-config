{ ... }:
{
  imports = [
    ./common.nix
    ./packages.nix

    ./desktop/loginManager
    ./desktop/windowManager
  ];
}
