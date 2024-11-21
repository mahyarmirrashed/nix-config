{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.applications.monitoring.processes.default;
in
{
  imports = [
    ./btop
    ./htop
  ];

  options.modules.applications.monitoring.processes.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default process monitoring tool for the system.";
  };

  config.assertions = [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.monitoring.processes.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.monitoring.processes.${cfg}.enable;
      message = "The default process monitoring tool must be enabled.";
    }
  ];
}
