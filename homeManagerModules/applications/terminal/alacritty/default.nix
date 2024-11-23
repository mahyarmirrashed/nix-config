{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.terminal.alacritty;
in
{
  options.modules.applications.terminal.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      alacritty
    ];
  };
}
