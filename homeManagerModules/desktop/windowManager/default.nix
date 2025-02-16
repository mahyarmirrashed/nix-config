{
  config,
  lib,
  osConfig,
  ...
}:
let
  headless = osConfig.modules.system.headless;

  browser = config.modules.applications.browser.default;
  terminal = config.modules.applications.terminal.default;
  launcher = config.modules.desktop.launcher.default;
in
{
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprpicker.nix
  ];

  config = lib.mkIf (!headless.enable) {
    wayland.windowManager.hyprland = {
      enable = true;

      settings = {
        "$mod" = lib.mkDefault "Super_L";
        "$terminal" = terminal;
        "$browser" = browser;
        "$launcher" = launcher;
        "$locker" = "hyprlock";

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
          # switch focus (arrow keys)
          "$mod, left, Focus on left, movefocus, l"
          "$mod, right, Focus on right, movefocus, r"
          "$mod, up, Focus on top, movefocus, u"
          "$mod, down, Focus on bottom, movefocus, d"
          # switch focus (Vim bindings)
          "$mod, h, Focus on left, movefocus, l"
          "$mod, j, Focus on right, movefocus, r"
          "$mod, k, Focus on top, movefocus, u"
          "$mod, l, Focus on bottom, movefocus, d"
          # switch workspace
          "$mod, 1, Switch to workspace 1, workspace, 1"
          "$mod, 2, Switch to workspace 2, workspace, 2"
          "$mod, 3, Switch to workspace 3, workspace, 3"
          "$mod, 4, Switch to workspace 4, workspace, 4"
          "$mod, 5, Switch to workspace 5, workspace, 5"
          "$mod, 6, Switch to workspace 6, workspace, 6"
          "$mod, 7, Switch to workspace 7, workspace, 7"
          "$mod, 8, Switch to workspace 8, workspace, 8"
          "$mod, 9, Switch to workspace 9, workspace, 9"
          "$mod, 0, Switch to workspace 10, workspace, 10"
          # move to workspace
          "$mod SHIFT, 1, Move to workspace 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, Move to workspace 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, Move to workspace 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, Move to workspace 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, Move to workspace 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, Move to workspace 6, movetoworkspacesilent, 6"
          "$mod SHIFT, 7, Move to workspace 7, movetoworkspacesilent, 7"
          "$mod SHIFT, 8, Move to workspace 8, movetoworkspacesilent, 8"
          "$mod SHIFT, 9, Move to workspace 9, movetoworkspacesilent, 9"
          "$mod SHIFT, 0, Move to workspace 10, movetoworkspacesilent, 10"
          "$mod CTRL, c, Move to empty workspace, movetoworkspace, empty"
          # application shortcuts
          "$mod, T, Open terminal, exec, $terminal"
          "$mod, grave, Open terminal, exec, $terminal"
          "$mod, E, Open browser, exec, $browser"
          "$mod, W, Close current window, killactive,"
          "$mod, L, Lock computer, exec, $locker"
          "$mod, space, Open launcher, exec, $launcher"

          ", XF86MonBrightnessUp, Increase brightness slightly, exec, brightnessctl set +5%"
          ", XF86MonBrightnessDown, Decrease brightness slightly, exec, brightnessctl set 5%-"
        ];
      };
    };
  };
}
