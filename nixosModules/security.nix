{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.oo7 ];
}
