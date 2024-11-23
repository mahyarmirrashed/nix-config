{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.browser.firefox;
in
{
  options.modules.applications.browser.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox
    ];
  };
}
