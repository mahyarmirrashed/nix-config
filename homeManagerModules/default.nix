{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users = lib.genAttrs config.modules.users (_: {
      imports = [
        ./applications
        ./desktop
      ];

      home.packages = with pkgs; [
        vim
        git
      ];
      home.stateVersion = "24.05";
    });
  };
}
