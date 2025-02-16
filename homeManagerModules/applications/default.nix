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
      element-desktop
    ];
  };
}
