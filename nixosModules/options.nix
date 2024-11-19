{ lib, ... }:
{
  options.modules.system.headless.enable = lib.mkEnableOption "headless";
}
