{ lib, pkgs, ... }:
{
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  networking.networkmanager.enable = lib.mkDefault true;

  time.timeZone = lib.mkDefault "America/Winnipeg";

  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    vim
    git
    tree
  ];
}
