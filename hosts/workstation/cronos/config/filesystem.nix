{ ... }: {
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/21ac97ce-9fe1-4710-8b6e-1bae0f5dae02";
      fsType = "btrfs";
      options = [ "subvol=rootfs" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/F224-186E";
      fstype = "vfat";
      options = [ "fmask=0777" "dmask=0777" ];
    };

    "/.swapvol" = {
      device = "/dev/disk/by-uuid/21ac97ce-9fe1-4710-8b6e-1bae0f5dae02";
      fsType = "btrfs";
      options = [ "subvol=swap" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/21ac97ce-9fe1-4710-8b6e-1bae0f5dae02";
      fsType = "btrfs";
      options = [ "subvol=home" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/21ac97ce-9fe1-4710-8b6e-1bae0f5dae02";
      fsType = "btrfs";
      options = [ "subvol=nix" ];
    };
  };

  swapDevices = { };
}
