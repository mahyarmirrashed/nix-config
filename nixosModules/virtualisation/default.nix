{ lib, ... }:
{
  options.modules.virtualisation = lib.mkEnableOption "virtualisation";
}
