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
        ];

        wallpaper = [ ",${custom.wallpapers.gruvbox.index.breeze}" ];
      };
    };
  };
}
