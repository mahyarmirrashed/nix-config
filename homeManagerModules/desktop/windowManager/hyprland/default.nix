{ config, lib, ... }:
let
  cfg = config.modules.desktop.windowManager.hyprland;
in
{
  wayland.windowManager.hyprland.settings = lib.mkIf cfg.enable {
    "$mod" = "SUPER";

    bindd = [
      "$mod, K, Open terminal, exec, kitty"
    ];
  };
}
