{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./home.nix
  ];

  networking.hostName = "cronos";

  system.stateVersion = "24.05";
}
