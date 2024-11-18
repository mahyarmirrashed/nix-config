{ lib, osConfig, ... }:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;
in
{
  wayland.windowManager.hyprland = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      exec-once = [ "hyprpaper" ];

      bindd = [
        "$mod, K, Open terminal, exec, kitty"
        "$mod, A, Open terminal, exec, alacritty"
      ];
    };
  };
}
