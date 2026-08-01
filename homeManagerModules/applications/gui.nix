{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    foot
  ];
}
