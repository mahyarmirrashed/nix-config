{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      yazi
    ];
  };

  options.modules.desktop.fileManager.default = lib.mkDefault "yazi";
}
