{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      btop
      htop
      iotop-c
    ];
  };
}
