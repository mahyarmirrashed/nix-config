{
  config,
  lib,
  osConfig,
  ...
}:
let
  headless = osConfig.modules.system.headless;
in
{
  config = lib.mkIf (!headless.enable) {
    programs.hyprlock.settings = {
      general = {
        disable_loading_bar = true;
      };
    };
  };
}
