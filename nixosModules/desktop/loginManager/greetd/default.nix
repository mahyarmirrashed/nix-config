{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.modules.desktop.loginManager.greetd;
in
{
  imports = [
    ./greeters/agreety.nix
    ./greeters/tuigreet.nix
  ];

  options.modules.desktop.loginManager.greetd.enable = lib.mkEnableOption "greetd";
  options.modules.desktop.loginManager.greetd.entrypoint =
    lib.mkPackageOption pkgs "bashInteractive"
      { };

  config = lib.mkIf cfg.enable {
    services.greetd.enable = true;
    # See: https://man.archlinux.org/man/greetd.5.en
    services.greetd.settings = {
      terminal = {
        vt = 1;
      };
      default_session = {
        # command attribute is populated by each individual greeter
        user = "greeter";
      };
    };

    users.users.greeter = {
      isSystemUser = true;
      description = "User for greetd.";
    };
  };
}
