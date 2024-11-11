{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager.greetd.agreety;
in
{
  options.nixosModules.desktop.loginManager.greetd.agreety.enable = lib.mkEnableOption "agreety";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe' pkgs.greetd.greetd "agreety"} \
      --cmd ${lib.meta.getExe pkgs.bashInteractive}
    '';
  };
}
