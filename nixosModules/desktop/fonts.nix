{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.geist-mono
  ];
}
