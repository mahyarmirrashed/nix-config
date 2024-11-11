{ lib, pkgs, ... }:
{
  getExePath =
    cfg:
    if cfg.hyprland.enable then
      "${lib.meta.getExe pkgs.hyprland}"
    else
      "${lib.meta.getExe pkgs.bashInteractive}";
}
