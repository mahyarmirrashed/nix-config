{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.virtualisation;

  headless = config.modules.system.headless;
in
{
  config = lib.mkIf cfg.enable {
    virtualisation.podman.enable = true;

    virtualisation.podman.dockerCompat = true;

    environment.systemPackages =
      with pkgs;
      [
        podman-tui
        podman-compose
        skopeo
      ]
      ++ lib.optionals (!headless) [ podman-desktop ];
  };
}