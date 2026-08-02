{ pkgs, ... }:
{
  imports = [
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    anyrun
    hyprpicker
    hyprshot
    pamixer
  ];
}
