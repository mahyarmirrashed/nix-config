{ pkgs, ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./home.nix
  ];

  networking.hostName = "hyperion";

  system.stateVersion = "24.05";

  modules.desktop.loginManager.tuigreet.enable = true;
  modules.desktop.loginManager.entrypoint = pkgs.hyprland;
  modules.virtualisation.enable = true;
}
