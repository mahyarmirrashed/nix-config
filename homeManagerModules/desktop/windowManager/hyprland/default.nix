{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;
  terminal = config.modules.applications.terminals.default;
in
{
  wayland.windowManager.hyprland = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = terminal;

      exec-once = [ "hyprpaper" ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bindd = [
        "$mod, T, Open terminal, exec, $terminal"
      ];
    };
  };
}
