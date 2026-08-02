{ pkgs, ... }:
{
  programs.lazydocker.enable = true;
  programs.lf.enable = true;

  home.packages = with pkgs; [
    defuddle
    fastfetch
    just
    ripgrep
    unzip
    wl-clipboard
  ];
}
