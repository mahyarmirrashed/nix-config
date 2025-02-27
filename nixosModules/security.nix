{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    oo7
  ];

  systemd.packages = with pkgs; [
    oo7
  ];
}
