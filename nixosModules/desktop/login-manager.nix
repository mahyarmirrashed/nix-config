{ lib, pkgs, ... }:
{
  services.greetd.enable = true;
  services.greetd.settings.terminal.vt = 1;
  services.greetd.settings.default_session.user = "greeter";
  services.greetd.settings.default_session.command = ''
    ${lib.meta.getExe pkgs.tuigreet} \
    --greeting "This Machine Kills Fascists!" \
    --time \
    --time-format "$(${lib.meta.getExe pkgs.ddate}) - %H:%M" \
    --remember \
    --theme "text=white;time=yellow;border=magenta;prompt=lightgreen;input=white;action=blue;button=yellow;" \
    --asterisks \
    --window-padding 2 \
    --power-shutdown "systemctl poweroff" \
    --power-reboot "systemctl reboot" \
    --cmd ${lib.meta.getExe pkgs.hyprland}
  '';

  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    description = "User for greetd.";
  };

  users.groups.greeter = { };
}
