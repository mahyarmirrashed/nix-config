{ config, lib, ... }:
{
  config = lib.mkIf (config.nixosModules.desktop.loginManager.selected == "greetd") {
    services.greetd.enable = true;
  };
}
