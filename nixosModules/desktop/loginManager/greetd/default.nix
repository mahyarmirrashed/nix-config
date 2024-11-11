{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager;
in
{
  options.nixosModules.desktop.loginManager.greetd.greeter = lib.mkOption {
    type = lib.types.enum [
      "agreety"
      "tuigreet"
    ];
    description = "Select the greeter to use.";
    default = "agreety";
  };

  config = lib.mkIf (cfg.selected == "greetd") {
    services.greetd.enable = true;
    # Parsed as a TOML file
    # See: https://man.archlinux.org/man/greetd.5.en
    services.greetd.settings = {
      terminal = {
        vt = 1;
      };
      default_session = {
        command = ''
          ${lib.meta.getExe pkgs.greetd.greetd}
          --cmd ${lib.meta.getExe pkgs.bashInteractive}
        '';
        user = "greeter";
      };
    };

    users.users.greeter = {
      isSystemUser = true;
      description = "User for greetd.";
    };
  };
}
