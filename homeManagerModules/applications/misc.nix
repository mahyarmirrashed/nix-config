{ pkgs, ... }:
{
  programs.lazydocker.enable = true;

  home.packages = with pkgs; [
    fastfetch
    just
    ripgrep
    unzip
    wl-clipboard
  ];
}
