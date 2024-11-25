{ custom, pkgs, ... }:
{
  stylix.enable = true;

  stylix.image = custom.wallpapers.default;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
}
