{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.agreety;
  entrypoint = config.modules.desktop.loginManager.entrypoint;
in
{
  options.modules.desktop.loginManager.agreety.enable = lib.mkEnableOption "agreety";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
      --cmd ${lib.meta.getExe entrypoint}
    '';
  };
}
