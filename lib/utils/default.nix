{ pkgs, ... }:
{
  windowManager.getExePath =
    cfg:
    if cfg.hyprland.enable then
      "${pkgs.lib.meta.getExe pkgs.hyprland}"
    else
      "${pkgs.lib.meta.getExe pkgs.bashInteractive}";
}
