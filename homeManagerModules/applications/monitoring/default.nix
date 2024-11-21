{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.applications.monitoring.default;
in
{
  imports = [
    ./btop
    ./htop
  ];

  options.modules.applications.monitoring.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default process monitoring tool for the system.";
  };

  config.assertions = [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.monitoring.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.monitoring.${cfg}.enable;
      message = "The default process monitoring tool must be enabled.";
    }
  ];
}
