{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.packages.utilities.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable core utility tools.";
  };

  config = lib.mkIf config.packages.utilities.enable {
    environment.systemPackages = with pkgs; [
      htop
      jq
      yq
      tree
      fzf
    ];
  };
}
