{ pkgs, ... }:
{
  users.users.mahyar = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  home-manager.users.mahyar = {
    home.packages = with pkgs; [
      vim
      git
    ];
    home.stateVersion = "24.05";
  };
}
