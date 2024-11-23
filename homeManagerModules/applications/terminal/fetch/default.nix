{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.terminal.fetch.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./fastfetch
  ];

  options.modules.applications.terminal.fetch.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default terminal fetcher for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.terminal.fetch.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.terminal.fetch.${cfg}.enable;
      message = "The default terminal fetcher must be enabled.";
    }
  ];
}
