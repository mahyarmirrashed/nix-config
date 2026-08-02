{ self, lib, pkgs, ... }:
{
  boot.initrd.systemd.dbus.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  time.timeZone = lib.mkDefault "Etc/UTC";

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = lib.mkDefault true;

  environment.systemPackages = [ pkgs.vim ];

  security.rtkit.enable = true;
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = self + "/lib/wallpapers/gruvbox/eden.png";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

  stylix.fonts.monospace = {
    package = pkgs.nerd-fonts.jetbrains-mono;
    name = "JetBrainsMono Nerd Font";
  };
}
