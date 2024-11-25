{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.greetd.agreety;
  entrypoint = config.modules.desktop.loginManager.greetd.entrypoint;
in
{
  options.modules.desktop.loginManager.greetd.agreety.enable = lib.mkEnableOption "agreety";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
      --cmd ${lib.meta.getExe entrypoint}
    '';
  };
}
