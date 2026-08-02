{ pkgs, ... }:
{
  programs.foot.enable = true;

  home.packages = [ pkgs.firefox ];
}
