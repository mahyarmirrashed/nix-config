{
  config,
  lib,
  pkgs,
  custom,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.greetd.tuigreet;

  windowManagerPath = custom.utils.windowManager.getExePath config.modules.desktop.windowManager;
in
{
  options.modules.desktop.loginManager.greetd.tuigreet.enable = lib.mkEnableOption "tuigreet";

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
      --cmd ${windowManagerPath}
    '';
  };
}
