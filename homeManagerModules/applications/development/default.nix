{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.development;
in
{
  options.modules.applications.development.enable = lib.mkEnableOption "development";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      git
      jj

      lazygit
      lazyjj
    ];
  };
}
