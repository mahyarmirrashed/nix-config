{
  config,
  lib,
  pkgs,
  custom,
  ...
}:
{
  command = ''
    ${lib.meta.getExe pkgs.greetd.tuigreet} \
    --greeting "Authenticate into ${custom.lib.strings.capitalize config.networking.hostName}" \
    --cmd ${lib.meta.getExe pkgs.bashInteractive}
  '';
}
