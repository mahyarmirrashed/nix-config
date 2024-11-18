{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.windowManager.hyprland;
in
{
  options.modules.desktop.windowManager.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [ kitty ];
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
