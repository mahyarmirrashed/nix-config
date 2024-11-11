{ lib, ... }:
{
  imports = [
    ./greetd
  ];

  options.nixosModules.desktop.loginManager.selected = lib.mkOption {
    type = lib.types.nullOr (lib.types.enum [ "greetd" ]);
    description = "Select the login manager to enable, or set to `null` to disable.";
    default = null;
  };
}
