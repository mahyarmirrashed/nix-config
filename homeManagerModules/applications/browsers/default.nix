{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.browsers.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./firefox
  ];

  options.modules.applications.browsers.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default browser for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.browsers.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.browsers.${cfg}.enable;
      message = "The default browser must be enabled.";
    }
  ];
}
