{ pkgs, ... }:
{
  lib.lists = import ./lists.nix { inherit pkgs; };
  lib.strings = import ./strings.nix { inherit pkgs; };

  lib.utils = import ./utils { inherit pkgs; };
}
