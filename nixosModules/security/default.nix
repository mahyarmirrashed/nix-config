{ ... }:
{
  security.pam.enable = true;

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
}
