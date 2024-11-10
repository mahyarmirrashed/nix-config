{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix

    ../../../nixosModules
  ];

  networking.hostName = "cronos";

  system.stateVersion = "24.05";
}
