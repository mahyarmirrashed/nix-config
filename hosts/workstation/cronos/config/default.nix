{ modulesPath, ... }:
{
  imports = [
    ./audiovisual.nix
    ./boot.nix
    ./filesystem.nix
    ./networking.nix

    (modulesPath + "/profiles/qemu-guest.nix")
  ];
}
