{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.htop;
in
{
  options.modules.applications.monitoring.htop.enable = lib.mkEnableOption "htop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      htop
    ];
  };
}
