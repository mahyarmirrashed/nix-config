{ ... }:
{
  modules.users = [ "mahyar" ];

  users.users.mahyar = {
    description = "Mahyar Mirrashed";

    extraGroups = [ "wheel" ];

    hashedPassword = "$y$j9T$o85wa68FyAb0aDM79aWb.1$0kCK6ZFd5BY5x/ZUZAc7Qi9z8bLRbfOFFoZWqkULu/A";
  };

  home-manager.users.mahyar = {
    modules.desktop.wallpaper.hyprpaper.enable = true;
    modules.applications.browser.firefox.enable = true;
    modules.applications.browser.default = "firefox";
    modules.applications.development.enable = true;
    modules.applications.terminal.alacritty.enable = true;
    modules.applications.terminal.default = "alacritty";
    modules.applications.monitoring.io.iotop-c.enable = true;
    modules.applications.monitoring.processes.btop.enable = true;
    modules.applications.monitoring.processes.htop.enable = true;
    modules.applications.monitoring.processes.default = "btop";
  };
}
