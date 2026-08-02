{ ... }:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.mahyar = {
      imports = [
        ./applications
        ./desktop
      ];

      stylix.targets.hyprlock.enable = false;

      home.stateVersion = "24.05";
    };
  };
}
