{ config, lib, ... }:
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

  config.assertions = [
    {
      assertion = config.modules.applications.terminals.default != null;
      message = ''The "modules.applications.terminals.default" option must be defined.'';
    }
  ];
}
