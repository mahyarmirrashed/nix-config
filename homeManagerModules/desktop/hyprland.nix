{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "Alt_L";
      "$terminal" = lib.getExe pkgs.foot;
      "$browser" = lib.getExe pkgs.firefox;
      "$launcher" = lib.getExe pkgs.anyrun;
      "$locker" = lib.getExe pkgs.hyprlock;

      exec-once = [ (lib.getExe pkgs.hyprpaper) ];

      general = {
        gaps_in = 0;
        gaps_out = 0;
      };

      animations = {
        enabled = false;
      };

      input = {
        touchpad = {
          natural_scroll = true;
          clickfinger_behavior = true;
        };

        touchdevice = {
          enabled = false;
        };
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
        # screenshot
        "$mod, S, Capture full screen (clipboard), exec, hyprshot -m output --clipboard-only"
        "$mod SHIFT, S, Capture region (clipboard), exec, hyprshot -m region --clipboard-only"
        "$mod ALT, S, Capture active window (clipboard), exec, hyprshot -m window --clipboard-only"
        "$mod CTRL, S, Capture full screen (save), exec, hyprshot -m output"
      ];
    };
  };
}
