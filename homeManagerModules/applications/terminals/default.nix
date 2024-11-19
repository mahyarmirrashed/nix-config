{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.terminals.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./alacritty
    ./wezterm
  ];

  options.modules.applications.terminals.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default terminal emulator for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.terminals.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.terminals.${cfg}.enable;
      message = "The default terminal must be enabled.";
    }
  ];
}
