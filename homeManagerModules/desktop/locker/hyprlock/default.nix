{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.locker.hyprlock;
in
{
  options.modules.desktop.locker.hyprlock.enable = lib.mkEnableOption "hyprlock";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprlock
    ];
  };
}
