{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hyperion";

  time.timeZone = "America/Vancouver";

  system.stateVersion = "24.05";
}
