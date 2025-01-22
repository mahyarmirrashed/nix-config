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
  config = lib.mkIf (!headless.enable) {
    home.packages = with pkgs; [
      firefox
    ];
  };

  options.modules.applications.browser.default = lib.mkOption {
    default = "firefox";
    type = lib.types.str;
  };
}
