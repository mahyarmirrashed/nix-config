{ pkgs, ... }:
{
  users.users.mahyar = {
    createHome = true;
    description = "Mahyar Mirrashed";

    isNormalUser = true;
    extraGroups = [ "wheel" ];

    hashedPassword = "$6$9KIgQ6x2cyLgRhQu$6LUUra8BGvTxj74gLMDl6QkgwKCvB9IA3.NH3g81/no08Xp.a/oRP5KpAMqR1z1g96LNqrBbduEhVYrWUbkS30";
  };

  home-manager.users.mahyar = {
    home.packages = with pkgs; [
      vim
      git
    ];
    home.stateVersion = "24.05";
  };
}
