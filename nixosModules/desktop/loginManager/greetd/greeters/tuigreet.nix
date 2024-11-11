{
  config,
  lib,
  pkgs,
  custom,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager.greetd.tuigreet;
in
{
  options.nixosModules.desktop.loginManager.greetd.tuigreet.enable = lib.mkEnableOption "tuigreet";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe pkgs.greetd.tuigreet} \
      --greeting "Authenticate into ${custom.lib.strings.capitalize config.networking.hostName}" \
      --cmd ${lib.meta.getExe pkgs.bashInteractive}
    '';
  };
}
