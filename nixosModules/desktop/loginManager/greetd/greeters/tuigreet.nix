{
  config,
  lib,
  pkgs,
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
      --greeting "Don't panic! This terminal knows where its towel is." \
      --time \
      --time-format "$(${lib.meta.getExe pkgs.ddate}) - %H:%M:%S" \
      --remember \
      --theme "text=white;time=yellow;border=magenta;prompt=lightgreen;input=white;action=blue;button=yellow;" \
      --asterisks \
      --window-padding 2 \
      --cmd ${lib.meta.getExe pkgs.bashInteractive}
    '';
  };
}
