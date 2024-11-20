{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;

  terminal = config.modules.applications.terminals.default;
  browser = config.modules.applications.browsers.default;
in
{
  wayland.windowManager.hyprland = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = terminal;
      "$browser" = browser;

      exec-once = [ "hyprpaper" ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bindd = [
        "$mod, T, Open terminal, exec, $terminal"
        "$mod, E, Open browser, exec, $browser"
      ];
    };
  };
}
