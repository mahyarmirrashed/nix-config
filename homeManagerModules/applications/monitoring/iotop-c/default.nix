{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.iotop-c;
in
{
  options.modules.applications.monitoring.iotop-c.enable = lib.mkEnableOption "iotop-c";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      iotop-c
    ];
  };
}
