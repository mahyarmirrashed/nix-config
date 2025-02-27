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
      discordo
      element-desktop
      gomuks
      pipes

      btop
      htop
      iotop-c
    ];
  };
}
