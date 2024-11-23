{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.fileManager.yazi;
in
{
  options.modules.desktop.fileManager.yazi.enable = lib.mkEnableOption "yazi";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      yazi
    ];
  };
}
