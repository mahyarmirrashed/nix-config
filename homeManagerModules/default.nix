{ pkgs, ... }:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.mahyar = {
      imports = [
        ./desktop
      ];

      home.packages = with pkgs; [
        vim
        git
      ];
      home.stateVersion = "24.05";
    };
  };
}
