{
  config,
  lib,
  pkgs,
  custom,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.greetd.agreety;

  windowManagerPath = custom.utils.windowManager.getExePath config.modules.desktop.windowManager;
in
{
  options.modules.desktop.loginManager.greetd.agreety.enable = lib.mkEnableOption "agreety";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
      --cmd ${windowManagerPath}
    '';
  };
}
