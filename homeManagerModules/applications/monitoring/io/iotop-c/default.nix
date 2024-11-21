{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.io.iotop-c;
in
{
  options.modules.applications.monitoring.io.iotop-c.enable = lib.mkEnableOption "iotop-c";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      iotop-c
    ];
  };
}
