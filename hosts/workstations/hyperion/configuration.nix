{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hyperion";

  system.stateVersion = "24.05";

  nixosModules.desktop.loginManager.selected = "greetd";
}
