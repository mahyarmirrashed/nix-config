{ pkgs, ... }:
{
  countTrue = pkgs.lib.count (x: x);
}
