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

  options.modules.applications.terminal.default = lib.mkDefault "alacritty";
  options.modules.applications.terminal.fetcher.default = lib.mkDefault "fastfetch";
}
