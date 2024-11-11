{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "hyperion";

  system.stateVersion = "24.05";

  nixosModules.desktop.loginManager.greetd.enable = true;
  nixosModules.desktop.loginManager.greetd.tuigreet.enable = true;
  nixosModules.desktop.windowManager.hyprland.enable = true;
}
