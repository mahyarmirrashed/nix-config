{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "cronos";

  system.stateVersion = "24.05";
}
