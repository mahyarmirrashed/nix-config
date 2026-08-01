{ ... }:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.mahyar = {
      imports = [
        ./applications
      ];

      home.stateVersion = "24.05";
    };
  };
}
