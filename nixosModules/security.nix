{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = [ pkgs.oo7 ];

  systemd.packages = [ pkgs.oo7 ];
  services.dbus.packages = [ pkgs.oo7 ];
}
