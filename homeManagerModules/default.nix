{ ... }:
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.mahyar = {
      home.stateVersion = "24.05";
    };
  };
}
