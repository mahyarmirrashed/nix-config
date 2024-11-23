{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.applications.terminal.fetcher.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./fastfetch
  ];

  options.modules.applications.terminal.fetcher.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default terminal fetcher for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.applications.terminal.fetcher.default" option must be defined.'';
    }
    {
      assertion = config.modules.applications.terminal.fetcher.${cfg}.enable;
      message = "The default terminal fetcher must be enabled.";
    }
  ];
}
