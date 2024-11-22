{ lib, ... }:
{
  options.modules.virtualisation.enable = lib.mkEnableOption "virtualisation";
}
