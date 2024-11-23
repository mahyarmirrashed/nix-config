{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.terminal.fetch.fastfetch;
in
{
  options.modules.applications.terminal.fetch.fastfetch.enable = lib.mkEnableOption "fastfetch";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
