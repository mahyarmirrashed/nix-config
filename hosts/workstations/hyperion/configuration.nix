{
  pkgs,
  ...
}:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "hyperion";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Winnipeg";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "24.05";
}
