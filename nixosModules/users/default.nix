{ config, lib, ... }:
let
  defaultUserConfig = {
    createHome = lib.mkDefault true;
    isNormalUser = lib.mkDefault true;
  };

  cfg = config.modules.users;
in
{
  options.modules.users = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ "mahyar" ];
    description = "List of system users to configure. 'mahyar' will always to be included.";
  };

  config.users.users = lib.genAttrs cfg (_: defaultUserConfig);
}
