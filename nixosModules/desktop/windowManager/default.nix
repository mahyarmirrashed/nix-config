{
  config,
  lib,
  pkgs,
  ...
}:
let
  headless = config.modules.system.headless;
in
{
  config = lib.mkIf (!headless.enable) {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      brightnessctl
      playerctl
      libinput-gestures
    ];

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
    };

    systemd.packages = [ pkgs.libinput-gestures ];

    # Specifically allow libinput-gestures access only to touchpad devices
    services.udev.packages = lib.singleton (
      pkgs.writeTextFile {
        name = "libinput-gestures-udev-rules";
        text = ''
          # Grant ACL access for touchpad devices specifically for libinput-gestures
          KERNEL=="event*", SUBSYSTEM=="input", ENV{ID_INPUT_TOUCHPAD}=="1", MODE="0660", TAG+="uaccess"
        '';
        destination = "/etc/udev/rules.d/70-libinput-gestures.rules";
      }
    );
  };
}
