{ config, lib, ... }:
let
  defaultUserConfig = {
    createHome = lib.mkDefault true;
    isNormalUser = lib.mkDefault true;
  };

  defaultUserSet = [ "mahyar" ];
  defaultUserSetConfig.mahyar = {
    description = "Mahyar Mirrashed";
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$o85wa68FyAb0aDM79aWb.1$0kCK6ZFd5BY5x/ZUZAc7Qi9z8bLRbfOFFoZWqkULu/A";
  };

  cfg = lib.unique (config.modules.users ++ defaultUserSet);
in
{
  options.modules.users = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ "mahyar" ];
    description = "List of system users to configure. 'mahyar' will always to be included.";
  };

  config.users.users = lib.mkMerge [
    # Dynamically generate default configurations for all users
    (lib.genAttrs cfg (_: defaultUserConfig))
    # Apply specific overrides for default user set
    defaultUserSetConfig
  ];
}
