{
  config,
  pkgs,
  ...
}: {
  system = "x86_64-linux";

  imports = [
    ./disko.nix
  ];
}
