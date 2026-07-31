{ config, lib, ... }:
{
  options.modules.tailscale.exitNode.enable = lib.mkEnableOption "Tailscale exit node";

  config = {
    networking.networkmanager.enable = true;

    services.tailscale = {
      enable = true;

      extraSetFlags = [
        "--operator=mahyar"
        "--ssh"
      ]
      ++ lib.optionals config.modules.tailscale.exitNode.enable [
        "--advertise-exit-node"
      ];
    };
  };
}
