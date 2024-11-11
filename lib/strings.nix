{ lib, ... }:
let
  inherit (lib.strings) substring stringLength toUpper;
in
{
  capitalize = str: "${toUpper (substring 0 1 str)}${substring 1 (stringLength str) str}";
}
