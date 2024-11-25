{
  config,
  custom,
  lib,
  ...
}:
let
  cfg = config.modules.desktop.wallpaper.hyprpaper;
in
{
  options.modules.desktop.wallpaper.hyprpaper.enable = lib.mkEnableOption "hyprpaper";

  config = lib.mkIf cfg.enable {
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
  };
}
