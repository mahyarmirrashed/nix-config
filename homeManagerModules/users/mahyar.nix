{ pkgs, ... }:
{
  users.users.mahyar = {
    createHome = true;
    description = "Mahyar Mirrashed";

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    hashedPassword = "$y$j9T$o85wa68FyAb0aDM79aWb.1$0kCK6ZFd5BY5x/ZUZAc7Qi9z8bLRbfOFFoZWqkULu/A";
  };

  home-manager.users.mahyar = {
    home.packages = with pkgs; [
      vim
      git
    ];
    home.stateVersion = "24.05";
  };
}
