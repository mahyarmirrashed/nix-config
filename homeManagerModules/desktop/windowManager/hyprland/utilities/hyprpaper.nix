{
  custom,
  ...
}:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${custom.wallpapers.gruvbox.index.breeze}"
        "${custom.wallpapers.gruvbox.index.eden}"
        "${custom.wallpapers.gruvbox.index.rust}"
        "${custom.wallpapers.gruvbox.index.space}"
      ];

      wallpaper = [ ",${custom.wallpapers.gruvbox.index.space}" ];
    };
  };
}
