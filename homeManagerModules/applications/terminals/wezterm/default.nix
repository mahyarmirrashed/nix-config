{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.terminals.wezterm;
in
{
  options.modules.applications.terminals.wezterm = lib.mkEnableOption "wezterm";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      wezterm
    ];
  };
}
