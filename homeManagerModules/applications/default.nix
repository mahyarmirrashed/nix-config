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
    ./monitoring
    ./terminal
  ];

  config = {
    home.packages = with pkgs; [
      cmatrix
      element-desktop
    ];
  };
}
