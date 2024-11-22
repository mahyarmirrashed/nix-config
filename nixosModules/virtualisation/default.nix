{ lib, ... }:
{
  imports = [
    ./containers
  ];

  options.modules.virtualisation.enable = lib.mkEnableOption "virtualisation";
}
