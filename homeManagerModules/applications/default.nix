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
      pipes

      btop
      htop
      iotop-c
    ];

    systemd.user.services = with pkgs; [
      oo7
    ];
  };
}
