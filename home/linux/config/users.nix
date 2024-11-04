{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.bashInteractive
    pkgs.docker
    pkgs.sudo
  ];

  users.defaultUserShell = pkgs.bashInteractive;
  users.users = {
    mahyar = {
      name = "mahyar";
      description = "Mahyar Mirrashed";

      createHome = true;
      isSystemUser = true;

      group = "users";
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
