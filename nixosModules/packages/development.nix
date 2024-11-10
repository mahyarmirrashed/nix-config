{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.packages.development.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable core development tools.";
  };

  config = lib.mkIf config.packages.development.enable {
    environment.systemPackages = with pkgs; [
      git
      vim
    ];
  };
}
