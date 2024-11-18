{ pkgs, ... }:
{
  home-manager.users.mahyar = {
    imports = [
      ./desktop
    ];

    home.packages = with pkgs; [
      vim
      git
    ];
    home.stateVersion = "24.05";
  };
}
