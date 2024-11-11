{
  lib,
  pkgs,
  ...
}:
{
  command = ''
    ${lib.meta.getExe pkgs.greetd.tuigreet} \
    --cmd ${lib.meta.getExe pkgs.bashInteractive}
  '';
}
