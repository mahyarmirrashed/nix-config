{ self, ... }:
{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        (self + "/lib/wallpapers/gruvbox/breeze.png")
        (self + "/lib/wallpapers/gruvbox/eden.png")
        (self + "/lib/wallpapers/gruvbox/rust.png")
        (self + "/lib/wallpapers/gruvbox/space.png")
      ];

      wallpaper = [ ("," + self + "/lib/wallpapers/gruvbox/eden.png") ];
    };
  };
}
