{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.desktop.launcher.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./anyrun
    ./rofi
  ];

  options.modules.desktop.launcher.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default launcher for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.desktop.launcher.default" option must be defined.'';
    }
    {
      assertion = config.modules.desktop.launcher.${cfg}.enable;
      message = "The default launcher must be enabled.";
    }
  ];
}
