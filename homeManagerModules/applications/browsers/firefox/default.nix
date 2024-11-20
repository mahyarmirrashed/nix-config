{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.browsers.firefox;
in
{
  options.modules.applications.browsers.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox
    ];
  };
}
