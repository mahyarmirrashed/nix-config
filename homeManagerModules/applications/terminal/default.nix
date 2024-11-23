{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.terminal.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./alacritty

    ./fetch
  ];

  options.modules.applications.terminal.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default terminal emulator for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.terminal.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.terminal.${cfg}.enable;
      message = "The default terminal must be enabled.";
    }
  ];
}
