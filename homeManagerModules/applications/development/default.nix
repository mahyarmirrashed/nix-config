{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      git
      jj

      lazygit
    ];
  };
}
