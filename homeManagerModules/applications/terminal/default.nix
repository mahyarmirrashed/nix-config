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
  config = {
    home.packages =
      with pkgs;
      [
        fastfetch
      ]
      ++ lib.optionals (!headless.enable) [ alacritty ];
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
