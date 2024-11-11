{
  config,
  lib,
  custom,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager.greetd;

  enabledCount = custom.lib.lists.countTrue [
    cfg.agreety.enable
    cfg.tuigreet.enable
  ];
in
{
  imports = [
    ./greeters/agreety.nix
    ./greeters/tuigreet.nix
  ];

  options.nixosModules.desktop.loginManager.greetd.enable = lib.mkEnableOption "greetd";

  config = lib.mkIf cfg.enable {
    services.greetd.enable = true;
    # Parsed as a TOML file
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

    assertions = [
      {
        assertion = enabledCount > 0;
        message = "No greeter is enabled for greetd.";
      }
      {
        assertion = enabledCount < 2;
        message = "More than one greeter is enabled for greetd.";
      }
    ];
  };
}
