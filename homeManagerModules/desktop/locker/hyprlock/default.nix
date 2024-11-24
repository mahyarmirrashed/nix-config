{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.locker.hyprlock;
in
{
  options.modules.desktop.locker.hyprlock.enable = lib.mkEnableOption "hyprlock";

  config = lib.mkIf cfg.enable {
    programs.hyprlock.settings = {
      general = {
        disable_loading_bar = true;
      };
    };
  };
}
