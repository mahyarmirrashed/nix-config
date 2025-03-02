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
      anyrun
      rofi
    ];
  };

  options.modules.desktop.launcher.default = lib.mkOption {
    default = "anyrun";
    type = lib.types.str;
  };
}
