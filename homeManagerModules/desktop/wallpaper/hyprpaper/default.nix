{
  config,
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
          "${../wallpapers/gruvbox/eden.png}"
          "${../wallpapers/gruvbox/rust.png}"
          "${../wallpapers/gruvbox/space.png}"
        ];

        wallpaper = [ ",${../wallpapers/gruvbox/space.png}" ];
      };
    };
  };
}
