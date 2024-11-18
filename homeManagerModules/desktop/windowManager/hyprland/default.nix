{ lib, osConfig, ... }:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;
in
{
  wayland.windowManager.hyprland = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      bindd = [
        "$mod, K, Open terminal, exec, kitty"
        "$mod, W, Open terminal, exec, wezterm"
      ];
    };
  };
}
