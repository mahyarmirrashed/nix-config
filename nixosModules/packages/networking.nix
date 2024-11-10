{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.packages.networking.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable core networking tools.";
  };

  config = lib.mkIf config.packages.networking.enable {
    environment.systemPackages = with pkgs; [
      curl
      wget
      netcat
      nmap
    ];
  };
}
