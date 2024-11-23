{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.launcher.anyrun;
in
{
  options.modules.desktop.launcher.anyrun.enable = lib.mkEnableOption "anyrun";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      anyrun
    ];
  };
}
