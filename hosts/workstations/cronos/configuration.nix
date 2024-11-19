{ ... }:
{
  imports = [
    ./disk-configuration.nix
    ./hardware-configuration.nix
    ./home.nix
  ];

  networking.hostName = "cronos";

  system.stateVersion = "24.05";

  modules.system.headless.enable = true;
}
