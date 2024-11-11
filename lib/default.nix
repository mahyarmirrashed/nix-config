{ pkgs, ... }:
{
  lib.countTrue = pkgs.lib.count (x: x);
  lib.strings = import ./strings.nix { inherit pkgs; };
}
