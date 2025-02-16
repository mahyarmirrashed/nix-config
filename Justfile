# Validate configuration.
check:
  nix flake check --all-systems

# Format configuration.
fmt:
  nix fmt **.nix

# Rebuild and switch into the new generation.
rebuild:
  nixos-rebuild switch
