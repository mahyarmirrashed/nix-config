{
  config,
  lib,
  osConfig,
  ...
}:
let
  cfg = config.modules.desktop.fileManager.default;
  headless = osConfig.modules.system.headless;
in
{
  imports = [
    ./yazi
  ];

  options.modules.desktop.fileManager.default = lib.mkOption {
    type = lib.types.nullOr lib.types.str;
    default = null;
    description = "The default file manager for the system.";
  };

  config.assertions = lib.mkIf (!headless.enable) [
    {
      assertion = cfg != null;
      message = ''The "modules.desktop.fileManager.default" option must be defined.'';
    }
    {
      assertion = config.modules.desktop.fileManager.${cfg}.enable;
      message = "The default file manager must be enabled.";
    }
  ];
}
