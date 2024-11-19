{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.terminals.alacritty;
in
{
  options.modules.applications.terminals.alacritty = lib.mkEnableOption "alacritty";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      alacritty
    ];
  };
}
