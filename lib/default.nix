{ pkgs, ... }:
{
  lib.strings = import ./strings.nix { inherit pkgs; };
}
