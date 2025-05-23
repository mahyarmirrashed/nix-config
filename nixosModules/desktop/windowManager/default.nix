{
  config,
  lib,
  pkgs,
  ...
}:
let
  headless = config.modules.system.headless;
in
{
  config = lib.mkIf (!headless.enable) {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      brightnessctl
      playerctl
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
