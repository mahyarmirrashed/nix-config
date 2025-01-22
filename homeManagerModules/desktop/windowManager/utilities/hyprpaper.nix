{
  custom,
  ...
}:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${custom.wallpapers.gruvbox.breeze}"
        "${custom.wallpapers.gruvbox.eden}"
        "${custom.wallpapers.gruvbox.rust}"
        "${custom.wallpapers.gruvbox.space}"
      ];

      wallpaper = [ ",${custom.wallpapers.default}" ];
    };
  };
}
