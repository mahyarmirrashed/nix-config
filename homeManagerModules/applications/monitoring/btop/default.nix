{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.monitoring.btop;
in
{
  options.modules.applications.monitoring.btop.enable = lib.mkEnableOption "btop";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      btop
    ];
  };
}
