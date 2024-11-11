{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixosModules.desktop.windowManager.hyprland;
in
{
  options.nixosModules.desktop.windowManager.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [ kitty ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
