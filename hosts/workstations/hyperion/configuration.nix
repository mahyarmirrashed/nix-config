{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix

    ../../../nixosModules
  ];

  networking.hostName = "hyperion";

  system.stateVersion = "24.05";
}
