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
      oo7

      btop
      htop
      iotop-c
    ];
  };
}
