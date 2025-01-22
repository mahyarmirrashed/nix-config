{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.tuigreet;
  entrypoint = config.modules.desktop.loginManager.entrypoint;
in
{
  options.modules.desktop.loginManager.tuigreet.enable = lib.mkEnableOption "tuigreet";

  config = lib.mkIf cfg.enable {
    services.greetd.settings.default_session.command = ''
      ${lib.meta.getExe pkgs.greetd.tuigreet} \
      --greeting "This Machine Kills Facists!" \
      --time \
      --time-format "$(${lib.meta.getExe pkgs.ddate}) - %H:%M:%S" \
      --remember \
      --theme "text=white;time=yellow;border=magenta;prompt=lightgreen;input=white;action=blue;button=yellow;" \
      --asterisks \
      --window-padding 2 \
      --cmd ${lib.meta.getExe entrypoint}
    '';
  };
}
