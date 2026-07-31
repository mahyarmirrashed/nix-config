{ pkgs, ... }:
{
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;
  virtualisation.podman.autoPrune.enable = true;
  virtualisation.podman.autoPrune.flags = [ "--volumes" ];

  environment.systemPackages = with pkgs; [
    buildah
    skopeo
  ];
}
