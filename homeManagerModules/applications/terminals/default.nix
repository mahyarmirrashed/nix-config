{ lib, ... }:
{
  imports = [
    ./alacritty
    ./wezterm
  ];

  options.modules.applications.terminals.default = lib.mkOption {
    type = lib.types.str;
    default = null;
    description = "The default terminal emulator for the system.";
  };
}
