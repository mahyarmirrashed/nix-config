{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.desktop.locker.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./anyrun
    ./rofi
  ];

  options.modules.desktop.locker.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default locker for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.desktop.locker.default" option must be defined.'';
    }
    {
      assertion = config.modules.desktop.locker.${cfg}.enable;
      message = "The default locker must be enabled.";
    }
  ];
}
