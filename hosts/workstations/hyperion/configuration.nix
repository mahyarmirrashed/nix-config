{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hyperion";
  networking.useDHCP = true;

  system.stateVersion = "24.05";
}
