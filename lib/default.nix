{ pkgs, ... }:
{
  lib.lists = import ./lists.nix { inherit pkgs; };
  lib.strings = import ./strings.nix { inherit pkgs; };
}
