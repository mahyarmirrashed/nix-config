{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.nixosModules.desktop.loginManager;

  greeters = {
    agreety = import ./greeters/agreety.nix { inherit config lib pkgs; };
    tuigreet = import ./greeters/tuigreet.nix { inherit config lib pkgs; };
  };

  greeter = lib.getAttrFromPath [ cfg.greetd.greeter ] greeters;
in
{
  options.nixosModules.desktop.loginManager.greetd.greeter = lib.mkOption {
    type = lib.types.enum (builtins.attrNames greeters);
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
        command = greeter.command;
        user = "greeter";
      };
    };

    users.users.greeter = {
      isSystemUser = true;
      description = "User for greetd.";
    };
  };
}
