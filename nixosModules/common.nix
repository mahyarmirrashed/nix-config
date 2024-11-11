{ lib, ... }:
{
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = lib.mkDefault "America/Winnipeg";

  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;
}
