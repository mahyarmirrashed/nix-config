{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.launcher.rofi;
in
{
  options.modules.desktop.launcher.rofi.enable = lib.mkEnableOption "rofi";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      rofi
    ];
  };
}
