{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.processes.btop;
in
{
  options.modules.applications.monitoring.processes.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      btop
    ];
  };
}
