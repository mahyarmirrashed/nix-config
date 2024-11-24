{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = osConfig.modules.desktop.windowManager.hyprland;

  browser = config.modules.applications.browser.default;
  terminal = config.modules.applications.terminal.default;
  locker = config.modules.desktop.locker.default;
in
{
  imports = [
    ./utilities
  ];

  wayland.windowManager.hyprland = lib.mkIf cfg.enable {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = terminal;
      "$browser" = browser;
      "$locker" = locker;

      exec-once = [ "hyprpaper" ];

      # XXX: remove after configurations
      debug = {
        disable_logs = false;
      };

      input = {
        touchpad = {
          natural_scroll = true;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      bindd = [
        "$mod, T, Open terminal, exec, $terminal"
        "$mod, grave, Open terminal, exec, $terminal"
        "$mod, E, Open browser, exec, $browser"
        "$mod, W, Close current window, killactive,"
        "$mod, L, Lock computer, exec, $locker"
      ];
    };
  };
}
