{ ... }: {
  system = "x86_64-linux";

  imports = [
    ../../../home/linux
    ./disko.nix
  ];
}
