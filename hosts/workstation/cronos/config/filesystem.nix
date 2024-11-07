{ ... }:
{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/f180281f-783c-40c3-9da4-3cb7a61517c3";
      fsType = "btrfs";
      options = [ "subvol=rootfs" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/AD8A-E23B";
      fsType = "vfat";
      options = [
        "fmask=0777"
        "dmask=0777"
      ];
    };

    "/.swapvol" = {
      device = "/dev/disk/by-uuid/f180281f-783c-40c3-9da4-3cb7a61517c3";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/f180281f-783c-40c3-9da4-3cb7a61517c3";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/f180281f-783c-40c3-9da4-3cb7a61517c3";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };
  };

  swapDevices = [
    {
      file = "/.swapvol/swapfile";
      size = 8 * 1014;
    }
  ];
}
