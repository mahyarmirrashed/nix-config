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

        general = {
          gaps_in = 0;
          gaps_out = 0;
          layout = "master";
        };

        decorations = {
          inactive_opacity = 0.8;
        };

        animations = {
          enabled = false;
        };

        input = {
          touchpad = {
            natural_scroll = true;
            clickfinger_behavior = true;
          };

          touchdevicce = {
            enabled = false;
          };
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_min_fingers = true;
          workspace_swipe_distance = 100;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        bind = [
          # switch focus (arrow keys)
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
          # switch focus (Vim keys)
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"
          # switch workspace
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
          "$mod, Tab, workspace, previous"
          # move to workspace
          "$mod SHIFT, 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, movetoworkspacesilent, 6"
          "$mod SHIFT, 7, movetoworkspacesilent, 7"
          "$mod SHIFT, 8, movetoworkspacesilent, 8"
          "$mod SHIFT, 9, movetoworkspacesilent, 9"
          "$mod SHIFT, 0, movetoworkspacesilent, 10"
          "$mod CTRL, c, movetoworkspace, empty"
          # window control, moving (arrow keys)
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          # window control, moving (Vim keys)
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, j, movewindow, d"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, l, movewindow, r"
          # window control, resizing (arrow keys)
          "$mod CTRL, left, resizeactive, -80 0"
          "$mod CTRL, right, resizeactive, 80 0"
          "$mod CTRL, up, resizeactive, 0 -80"
          "$mod CTRL, down, resizeactive, 0 80"
          # window control, resizing (Vim keys)
          "$mod CTRL, h, resizeactive, -80 0"
          "$mod CTRL, j, resizeactive, 80 0"
          "$mod CTRL, k, resizeactive, 0 -80"
          "$mod CTRL, l, resizeactive, 0 80"
          # window control, move active (arrow keys)
          "$mod ALT, left, moveactive, -80 0"
          "$mod ALT, right, moveactive, 80 0"
          "$mod ALT, up, moveactive, 0 -80"
          "$mod ALT, down, moveactive, 0 80"
          # window control, move active (Vim keys)
          "$mod ALT, h, moveactive, -80 0"
          "$mod ALT, j, moveactive, 80 0"
          "$mod ALT, k, moveactive, 0 -80"
          "$mod ALT, l, moveactive, 0 80"
          # brightness controls
          ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
          # media controls
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioStop, exec, playerctl stop"
          # volume controls
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioMute, exec, pamixer -t"
        ];

        bindd = [
          # application shortcuts
          "$mod, T, Open terminal, exec, $terminal"
          "$mod, grave, Open terminal, exec, $terminal"
          "$mod, E, Open browser, exec, $browser"
          "$mod, Q, Close current window, killactive,"
          "$mod, L, Lock computer, exec, $locker"
          "$mod, space, Open launcher, exec, $launcher"
        ];
      };
    };
  };
}
