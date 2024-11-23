{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.browser.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./firefox
  ];

  options.modules.applications.browser.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default browser for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.browser.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.browser.${cfg}.enable;
      message = "The default browser must be enabled.";
    }
  ];
}
