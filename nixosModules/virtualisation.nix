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
  options.modules.virtualisation.enable = lib.mkEnableOption "virtualisation";

  config = lib.mkIf cfg.enable {
    virtualisation.podman.enable = true;

    virtualisation.podman.dockerCompat = true;

    environment.systemPackages =
      with pkgs;
      [
        podman-tui
        podman-compose

        buildah
        skopeo
      ]
      ++ lib.optionals (!headless.enable) [ podman-desktop ];
  };
}
