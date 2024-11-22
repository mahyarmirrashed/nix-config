{ config, lib, ... }:
let
  cfg = config.modules.virtualisation;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.podman.enable = true;

    virtualisation.podman.dockerCompat = true;
  };
}
