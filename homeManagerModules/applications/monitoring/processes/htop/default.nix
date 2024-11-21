{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.processes.htop;
in
{
  options.modules.applications.monitoring.processes.htop.enable = lib.mkEnableOption "htop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      htop
    ];
  };
}
