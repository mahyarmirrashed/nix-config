{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.applications.terminal.fetcher.fastfetch;
in
{
  options.modules.applications.terminal.fetcher.fastfetch.enable = lib.mkEnableOption "fastfetch";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fastfetch
    ];
  };
}
