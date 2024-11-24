{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./home.nix
  ];

  networking.hostName = "hyperion";

  system.stateVersion = "24.05";

  modules.desktop.loginManager.greetd.enable = true;
  modules.desktop.loginManager.greetd.tuigreet.enable = true;
  modules.desktop.windowManager.hyprland.enable = true;
  modules.desktop.locker.hyprlock.enable = true;
  modules.virtualisation.enable = true;
}
