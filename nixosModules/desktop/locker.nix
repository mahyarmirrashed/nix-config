{
  config,
  lib,
  ...
}:
let
  headless = config.modules.system.headless;
in
{
  config = lib.mkIf (!headless.enable) {
    programs.hyprlock.enable = true;

    security.pam.services.hyprlock = { };
  };
}
