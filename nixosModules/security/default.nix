{ ... }:
{
  security.pam.enable = true;

  services.udev.extraRules = ''
    # Apply uaccess for touchpad devices
    KERNEL=="event*", SUBSYSTEM=="input", ENV{ID_INPUT_TOUCHPAD}=="1", MODE="0660", TAG+="uaccess"
  '';
}
