# Validate configuration.
check:
  nix flake check --all-systems

# Format configuration.
fmt:
  @nix fmt 2&>1 >/dev/null && echo "Formatted the codebase!"

# Rebuild and switch into the new generation.
rebuild:
  nixos-rebuild switch
