{
  config,
  lib,
  pkgs,
  custom,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager.greetd.agreety;

  windowManagerPath = custom.lib.utils.windowManager.getExePath config.nixosModules.desktop.windowManager;
in
{
  options.nixosModules.desktop.loginManager.greetd.agreety.enable = lib.mkEnableOption "agreety";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
      --cmd ${windowManagerPath}
    '';
  };
}
