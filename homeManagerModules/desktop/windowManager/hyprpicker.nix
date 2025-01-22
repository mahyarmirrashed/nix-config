{
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
      hyprpicker
    ];
  };
}
