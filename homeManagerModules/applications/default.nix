{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./browsers.nix
    ./development.nix
    ./terminal.nix
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
