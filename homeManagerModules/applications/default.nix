{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./browsers
    ./development
    ./terminal
  ];

  config = {
    home.packages = with pkgs; [
      cmatrix
      element-desktop

      btop
      htop
      iotop-c
    ];
  };
}
