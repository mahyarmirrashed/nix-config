{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  headless = osConfig.modules.system.headless;
in
{
  config = lib.mkIf headless.enable {
    home.packages = with pkgs; [
      alacritty
      fastfetch
    ];
  };

  options.modules.applications.terminal.default = lib.mkOption {
    default = "alacritty";
    type = lib.types.str;
  };
  options.modules.applications.terminal.fetcher.default = lib.mkOption {
    default = "fastfetch";
    type = lib.types.str;
  };
}
