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
      gh
      jj

      neovim
      lazygit
    ];

    programs.neovim = {
      defaultEditor = true;
    };
  };
}
