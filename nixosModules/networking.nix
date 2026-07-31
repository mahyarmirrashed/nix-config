{ config, lib, ... }:
{
  options.modules.tailscale.exitNode.enable = lib.mkEnableOption "Tailscale exit node";

  config.services.tailscale = {
    enable = true;

    extraSetFlags = [
      "--operator=mahyar"
      "--ssh"
    ]
    ++ lib.optionals config.modules.tailscale.exitNode.enable [
      "--advertise-exit-node"
    ];
  };
}
