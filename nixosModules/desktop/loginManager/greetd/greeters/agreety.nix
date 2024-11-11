{
  lib,
  pkgs,
  ...
}:
{
  command = ''
    ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
    --cmd ${lib.meta.getExe pkgs.bashInteractive}
  '';
}
