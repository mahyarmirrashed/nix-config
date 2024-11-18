{ pkgs, ... }:
{
  modules.users = [ "mahyar" ];

  users.users.mahyar = {
    description = "Mahyar Mirrashed";

    extraGroups = [ "wheel" ];

    hashedPassword = "$y$j9T$o85wa68FyAb0aDM79aWb.1$0kCK6ZFd5BY5x/ZUZAc7Qi9z8bLRbfOFFoZWqkULu/A";
  };

  home-manager.users.mahyar = {
    home.packages = with pkgs; [
      alacritty
      kitty
    ];
  };
}
