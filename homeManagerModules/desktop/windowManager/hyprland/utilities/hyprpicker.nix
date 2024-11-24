{
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpicker
    ];
  };
}
